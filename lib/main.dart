import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List finalR = [];

  String jsonData = "";

  loadJSON() async {
    jsonData = await rootBundle.loadString("Assets/std_file.json");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON APP"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () async {
            List decodedData = jsonDecode(jsonData);

            setState((){
              finalR = decodedData;
            });
          }, icon: Icon(Icons.save_alt)),
        ],
      ),
      body:
      ListView.builder(itemCount: finalR.length,
              itemBuilder: (context,i){
            return Card(
              elevation: 5,
              child: ListTile(
                leading: Text("${finalR[i]['id']}"),
                title: Text("${finalR[i]['name']}"),
                subtitle: Text("${finalR[i]['course']}"),
              ),
            );
          })
    );
  }
}
