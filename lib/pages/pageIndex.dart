import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class pageIndex extends StatefulWidget {
  @override
  _pageIndexState createState() => _pageIndexState();
}

class _pageIndexState extends State<pageIndex>
    with SingleTickerProviderStateMixin {
  List<String> tabTexts = ["推荐", "关注", "前端", "后端", "iOS", "Android", "人工智能"];
  TabController _tabController;
  getTabs() {
    List<Tab> results = [];
    for (int i = 0; i < tabTexts.length; i++) {
      results.add(Tab(
        text: tabTexts[i],
      ));
    }
    return results;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabTexts.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getTabViews() {
      List<Widget> results = [];
      for (int i = 0; i < tabTexts.length; i++) {
        if (i == 0) {
          results.add(ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                      height: 40,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, i) {
                            return TextButton(
                                onPressed: () {}, child: Text("$i"));
                          }));
                }
                return Center(
                  child: Text("$index"),
                );
              }));
        } else {
          results.add(Center(
            child: Text(tabTexts[i]),
          ));
        }
      }
      return results;
    }

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                  child: FlatButton(
                color: Color.fromRGBO(238, 242, 245, 1),
                onPressed: () {},
                child: Text(
                  "搜索",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              )),
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.settings),
                  label: Text("设置"))
            ],
          ),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: getTabs(),
          ),
        ),
        body: TabBarView(controller: _tabController, children: getTabViews()));
  }
}
