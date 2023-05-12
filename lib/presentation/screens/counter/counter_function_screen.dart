import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_outlined),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
          ],
          title: const Center(
            child: Text('Counter Functions'),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
                icon: Icons.refresh_outlined,
                onPressed: () {
                  setState(() {
                    clickCounter = 0;
                  });
                }),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                icon: Icons.exposure_minus_1_rounded,
                onPressed: () {
                  setState(() {
                    if (clickCounter ==  0) return;
                    clickCounter--;
                  });
                }),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                icon: Icons.plus_one,
                onPressed: () {
                  setState(() {
                    clickCounter++;
                  });
                })
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter',
                  style: const TextStyle(
                      fontSize: 160, fontWeight: FontWeight.w100)),
              Text('Click${clickCounter == 1 ? '' : 's'}',
                  style: const TextStyle(fontSize: 25))
              // Text(clickCounter == 1 ? 'Click' : 'Clicks', style: TextStyle(fontSize: 25))
            ],
          ),
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      enableFeedback: true,
      elevation: 1,
      backgroundColor: Colors.green,
      onPressed: onPressed,
      foregroundColor: Colors.white,
      child: Icon(icon),
    );
  }
}
