import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:test_board/screens/home_screen.dart';
import 'package:test_board/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool alreadySeen = prefs.getBool('alreadySeen') ?? false;

  runApp(MyApp(alreadySeen: alreadySeen));
}

class MyApp extends StatelessWidget {
  final bool alreadySeen;

  const MyApp({super.key, required this.alreadySeen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clean Code',
        theme: ThemeData(primaryColor: Colors.blue),
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: const Icon(
              Icons.sports_basketball,
              size: 90,
              color: Colors.blue,
            ),
            nextScreen:
                alreadySeen ? const HomeScreen() : const OnBoardingScreen(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.white));
  }
}
