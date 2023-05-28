import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'countries.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const FlashCard();
  }
}

class FlashCard extends StatefulWidget {
  const FlashCard({super.key});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  int score = 0;
  int totalScore = 234;
  bool showAnswer = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent.shade200,
          title: Text(
            "Guess the Capital CIty",
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Text("Reset"),
          onPressed: () {
            setState(() {
              score = 0;
              totalScore = 0;
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "Score ${score}/${totalScore}",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6),
              child: SizedBox(
                height: 200,
                child: Card(
                  elevation: 20,
                  shadowColor: Colors.greenAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        !showAnswer ? "Country" : "Capital",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        !showAnswer
                            ? countries[totalScore]['country']!
                            : countries[totalScore]['city']!,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showAnswer = !showAnswer;
                  });
                },
                child: Text("Show ${showAnswer ? 'Question' : 'Answer'}"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        if (totalScore < countries.length - 1) {
                          score++;
                          totalScore++;
                        } else {
                          Alert(
                                  context: context,
                                  title: 'ALERT',
                                  desc:
                                      'You already have reached to the end of List')
                              .show();
                        }
                      },
                    );
                  },
                  child: Text("Correct"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (totalScore < countries.length - 1) {
                        totalScore++;
                      }
                       else
                      {
                       Alert(
                      context: context,
                      title: 'ALERT',
                       desc: 'You already have reached to the end of List'
                       ).show();
                      }
                    },
                    );
                  },
                  child: Text("Wrong"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
