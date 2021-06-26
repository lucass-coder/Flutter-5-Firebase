import 'package:alura_crashlytics/screens/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized(); //Avisa o Flutter
  await Firebase.initializeApp(); //inicia o Firebase de forma assíncrona
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  //Informa o Flutter que a parte de monitorar erro fica a cargo do Crashlytics

  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Color.fromRGBO(71, 161, 56, 1),
        buttonTheme: ButtonThemeData(
          buttonColor: Color.fromRGBO(71, 161, 56, 1),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
