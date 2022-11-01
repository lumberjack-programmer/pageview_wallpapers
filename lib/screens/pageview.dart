import 'dart:ui';

import 'package:flutter/material.dart';


class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  late final PageController pageController = PageController(viewportFraction: 0.8, keepPage: false);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      if (pageController.page?.round() != currentPage) {
        setState(() {
          if (pageController.page! == 0.0) {
            currentPage = 0;
          } else if (pageController.page! > 0.0 && pageController.page! < 0.5) {
            currentPage = 0;
          } else
          if (pageController.page! >= 0.5 && pageController.page! <= 1.0) {
            currentPage = 1;
          } else if (pageController.page! > 1.0 && pageController.page! < 1.5) {
            currentPage = 1;
          } else
          if (pageController.page! >= 1.5 && pageController.page! <= 2.0) {
            currentPage = 2;
          } else if (pageController.page! > 2.0 && pageController.page! < 2.5) {
            currentPage = 2;
          } else
          if (pageController.page! >= 2.5 && pageController.page! <= 3.0) {
            currentPage = 3;
          } else if (pageController.page! > 3.0 && pageController.page! < 3.5) {
            currentPage = 3;
          } else
          if (pageController.page! >= 3.5 && pageController.page! <= 4.0) {
            currentPage = 4;
          } else if (pageController.page! > 4.0 && pageController.page! < 4.5) {
            currentPage = 4;
          }

        }
        );
      }


    });
  }


  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ClipRect(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('images/windows-${currentPage}.jpg'), fit: BoxFit.cover,  scale: 0.5,),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 70.0, sigmaY: 70.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 100.0, horizontal: size.width / 2 - 140),
                        child: Text('@lumberjack_programmer', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 18.0, letterSpacing: 1.3),),),
                    ),
                  ),
                ),
              ),
            ),
          ),
          PageView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              controller: pageController,
              itemBuilder: (context, position) {
                return Container(
                  height: double.infinity,
                  margin: EdgeInsets.only(
                      top: currentPage == position ? 200 : 250,
                      left: 15.0,
                      right: 15.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 18,
                        offset: Offset(10, 0),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      child: Stack(
                       fit: StackFit.expand,
                        children: [
                          Positioned(
                            left: currentPage == position? -80: -20,
                            top: 0,
                            bottom: 0,
                            child: Image.asset('images/windows-${position}.jpg', fit: BoxFit.fitHeight,),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}


// Container(
// margin: EdgeInsets.only(
// top: currentPage == position ? 200 : 250.0,
// left: 10.0,
// right: 10.0),
// decoration: BoxDecoration(
// boxShadow: [
// BoxShadow(
// color: Colors.black.withOpacity(0.5),
// spreadRadius: 1,
// blurRadius: 18,
// offset: Offset(10, 0), // changes position of shadow
// ),
// ],
// borderRadius: const BorderRadius.only(
// topLeft: Radius.circular(20.0),
// topRight: Radius.circular(20.0),
// ),
// image: DecorationImage(
// image: AssetImage('images/windows-${position}.jpg',), scale: currentPage == position ? .8 : 1,
// fit: BoxFit.cover),
// ),
// );