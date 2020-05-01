import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Image.network(
                  "https://www.thoughtco.com/thmb/xYOvozShc5Zo86rD53lqcFFmp5A=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/abstract-paper-flower-pattern-656688606-5acfba2eae9ab80038461ca0.jpg"),
            ),
            Text("Hello")
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    var path = new Path();
    path.lineTo(0, size.height * .9);
    var firstEndPoint = new Offset(size.width * .5, size.height * .9);
    var firstControlPoint = new Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = new Offset(size.width, size.height);
    var secondControlPoint = new Offset(size.width * .75, size.height * .75);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    //path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
