// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, unused_local_variable, avoid_print

import 'package:flash_chat/components/Rounded_Button.dart';
import 'package:flash_chat/constrain.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "register_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  String email;
  String password;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
    animation = ColorTween(begin: Colors.white, end: Colors.cyan[200])
        .animate(controller);
    controller.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: "logo",
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (value) {
                //Do something with the user input.
                email = value;
              },
              decoration: kTextFieldStyle.copyWith(
                hintText: "Enter Your Email",
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (value) {
                //Do something with the user input.
                password = value;
              },
              decoration: kTextFieldStyle.copyWith(
                hintText: "Enter Your Password",
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              onPress: () {
                print(email);
                print(password);
              },
              title: "Register",
              colour: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
