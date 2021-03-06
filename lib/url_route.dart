library url_route;

import 'package:flutter/material.dart';

class UrlRoute {
  static Map<String, WidgetBuilder> routes;

  Route<dynamic> generator(RouteSettings settings) {
    if (routes[settings.name] != null) {
      WidgetBuilder builder = routes[settings.name];
      return MaterialPageRoute(builder: builder, settings: settings);
    }
    Uri url = Uri.parse(settings.name);
    if (routes[url.path] != null) {
      WidgetBuilder builder = routes[url.path];
      RouteSettings newSetting = RouteSettings(
          name: url.path,
          arguments: url.queryParameters);
      return MaterialPageRoute(builder: builder, settings: newSetting);
    }
    print("未找到的路由！");
    return RouteMatch().route;
  }
}

class RouteMatch {
  RouteMatch({this.route});
  final Route<dynamic> route;
}
