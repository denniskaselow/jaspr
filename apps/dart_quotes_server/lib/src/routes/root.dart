import 'dart:io';

import 'package:jaspr/server.dart';
import 'package:jaspr_serverpod/jaspr_serverpod.dart';
import 'package:serverpod/server.dart';

import '../../web/app.dart';

class RootRoute extends JasprRoute {
  @override
  Future<Component> build(Session session, HttpRequest request) async {
    return Document(
      title: 'Dart Quotes',
      lang: 'en',
      meta: {
        "description": "A collection of cool Dart quotes. Built for FullStackFlutter Conference.",
      },
      styles: [
        // Include text font
        css.fontFace(family: "Roboto", url: "/fonts/Roboto-Regular.woff"),
        css.fontFace(family: "Roboto", style: FontStyle.italic, url: "/fonts/Roboto-Italic.woff"),

        // Include icon font
        css.fontFace(family: "icomoon", url: "/fonts/icomoon.ttf"),
        css('[class^="icon-"], [class*=" icon-"]').styles(fontFamily: FontFamily('icomoon')),
        css('.icon-heart-o:before').styles(content: r'\e900'),
        css('.icon-heart:before').styles(content: r'\e901'),

        // Root styles
        css('html, body').styles(
          fontFamily: const FontFamily.list([FontFamily('Roboto'), FontFamilies.sansSerif]),
          width: 100.percent,
          minHeight: 100.vh,
          margin: Margin.zero,
          padding: Padding.zero,
          backgroundColor: Color.hex('#F7F7F7'),
        ),
        css('h1').styles(
          fontSize: 4.rem,
          margin: Margin.unset,
        ),
      ],
      body: App(),
    );
  }
}
