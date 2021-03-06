import 'package:flutter/material.dart';
class SpeakerDetailPage extends StatefulWidget {

  const SpeakerDetailPage({
    Key key,
    this.id,

  }) : super(key: key);

  final String id;

    @override
   _SpeakerDetailPage createState() => _SpeakerDetailPage();
}
class _SpeakerDetailPage extends State<SpeakerDetailPage> {
    @override
  Widget build(BuildContext context) {
        //获取路由参数  
    var speakerId=ModalRoute.of(context).settings.arguments;
    List<Widget> list = <Widget> [
      CustomListItem(title: '关于音箱', urlName:'/', id: speakerId),
      CustomListItem(title: '音箱重命名', urlName:'/', id: speakerId),
      CustomListItem(title: '音箱组合配对', urlName:'/', id: speakerId),
      CustomListItem(title: '忽略音箱', urlName:'/', id: speakerId),
      CustomListItem(title: '均衡器', urlName:'/', id: speakerId),
      CustomListItem(title: '指示灯亮度调节', urlName:'/', id: speakerId),
      CustomListItem(title: '提示音', urlName:'/', id: speakerId),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('设置$speakerId'),
      ),
       body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: ListView(
            children: list
          ),
        ),
       )
    );
  }
 }

 class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.title,
    this.urlName,
    this.id,
  });

  final String title;
  final String urlName;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child:Text(title)
          ),
          IconButton(
            icon: Icon(
              Icons.navigate_next,
              size: 20.0,
            ),
            tooltip: '点击查看详情',
            onPressed: () {
              Navigator.of(context).pushNamed("/$urlName", arguments: id);
            },
          ),

        ],
      ),


    );
  }
}