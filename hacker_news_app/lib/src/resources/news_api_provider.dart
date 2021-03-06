import 'dart:convert';

import 'package:http/http.dart' show Client;

import '../models/item_model.dart';

const _baseUrl = 'https://hacker-news.firebaseio.com/v0/';

class NewsApiProvider {
  Client _client = Client();

  dynamic fetchTopIds() async {
    final response = await _client.get('$_baseUrl/topstories.json');
    final ids = json.decode(response.body);
    return ids;
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await _client.get('$_baseUrl/item/$id');
    final parsedJson = json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}
