import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(GetApi());
}

class GetApi extends StatefulWidget {
  const GetApi({Key? key}) : super(key: key);

  @override
  _GetApiState createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  final url = "https://jsonplaceholder.typicode.com/posts";

  var _postsJson = [];

  void fetchPost() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ListView.builder(
              itemCount: _postsJson.length,
              itemBuilder: (context, i) {
                final post = _postsJson[i];
                return Text(
                    "Title: ${post["title"]}\n Body: ${post["body"]}\n\n");
              })),
    );
  }
}
