import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_absence/views/onboarding_screen.dart';
import 'package:student_absence/utils/token_helper.dart';
import 'package:student_absence/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    await Future.delayed(Duration(seconds: 2)); 

    final token = await TokenHelper.getToken();
    if (token != null) {
      final isValid = await TokenHelper.validateToken();
      if (isValid) {
        Get.off(() => HomeScreen());
        return;
      }
    }
    Get.off(() => OnboardingScreen());
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 80, 154, 1),
      body: Center(
        child: Image.asset(
          'assets/images/splash-screen-logo.png',
          width: screenSize.width * 0.3,
          height: screenSize.height * 0.2,
        ),
      ),
    );
  }
}
