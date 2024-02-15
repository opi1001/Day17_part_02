import 'package:flutter/material.dart';
import 'package:practice_17_part_02/page1.dart';
import 'package:practice_17_part_02/page2.dart';
import 'package:practice_17_part_02/page3.dart';
import 'package:practice_17_part_02/page4.dart';

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({super.key});

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController? pageController;
  int currentIndex = 1;
  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController(
      initialPage: currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.amber,
        // ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: [
                    Page1(),
                    Page2(),
                    Page3(),
                    Page4(),
                  ],
                ),
              ),
              Container(
                height: 100.0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            currentIndex = 0;
                            pageController!.jumpToPage(0);
                          });
                        },
                        child: Text("Page1"),
                        color: currentIndex == 0 ? Colors.teal : Colors.red,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            pageController!.jumpToPage(1);
                          });
                        },
                        child: Text("Page2"),
                        color: currentIndex == 1 ? Colors.teal : Colors.red,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            currentIndex = 2;
                            currentIndex = 1;
                            pageController!.jumpToPage(2);
                          });
                        },
                        child: Text("Page3"),
                        color: currentIndex == 2 ? Colors.teal : Colors.green,
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            currentIndex = 2;
                            pageController!.jumpToPage(3);
                          });
                        },
                        child: Text("Page4"),
                        color: currentIndex == 3 ? Colors.teal : Colors.purple,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
