import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Lottie Animations'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            isLiked = !isLiked;
            if (isLiked) {
              animationController.forward();
            } else {
              animationController.reverse();
            }
          },
          child: Lottie.network(
            "https://lottie.host/3143a1c5-41d8-44d9-9d45-c8f496f0ec38/2B4rbexsem.json",
            controller: animationController,
          ),
        ),
      ),
    );
  }
}
