import 'dart:ui';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  late final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final list = [];
  final controllerText = TextEditingController();
  final isEditing = false;
  late final indice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Name List")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                child: TextField(
                  controller: controllerText,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your name',
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              SizedBox(
                width: 160,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    final name = controllerText.text;
                    if (name.isNotEmpty) {
                      setState(() {
                        list.add(name);
                        controllerText.clear();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: const Size(100, 40),
                    textStyle: const TextStyle(color: Colors.white),
                  ),
                  child: const Text("Add"),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return Row(
                      children: [
                        Expanded(
                            child: ListTile(
                          title: Text(item),
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: (() {
                            setState(() {
                              list.removeAt(index);
                            });
                          }),
                          child: const Text("Delete"),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
