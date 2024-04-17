// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_counter_bloc_example/src/blocs/counter_bloc/counter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  CounterBloc counterBloc = CounterBloc();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<dynamic>(
            stream: counterBloc.pressedCount,
            builder: (context, snapshot) {
              return Text(
                'Flutter Counter Bloc Example - ${snapshot.data.toString()}',
              );
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<dynamic>(
                stream: counterBloc.pressedCount,
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data.toString(),
                    style: Theme.of(context).textTheme.displayLarge,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 100.0,
        height: 100.0,
        child: FloatingActionButton(
          onPressed: () {
            counterBloc.incrementCounter.add(null);
          },
          tooltip: 'Increment',
          child: const Text(
            "+ \n send \n to BLoC",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
