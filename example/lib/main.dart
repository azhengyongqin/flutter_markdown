// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const String _markdownData = """
```go
package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})
	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
```

**模板**：
```html
<filter-table @on-search="onSearch"
              :data="users"
              :columns="tableColumns">
</filter-table>
```
**列描述数据对象：**
```js
tableColumns: [
  {
    title: '用户名',
    key: 'username',
    filter: {
      type: 'Input' //输入框过滤
    }
  },
  {
    title: '状态',
    key: 'status',
    filter: {
      type: 'Select',//下拉框过滤
      option: userStatus //下拉框选项数据对象
    }
  }
]
```
**下拉框选项数据格式：**
```js
  const userStatus = {
    0: {
      value: 0,
      name: '全部'
    },
    1: {
      value: 1,
      name: '已锁定',
      color: 'red'
    },
    2: {
      value: 2,
      name: '正常',
      color: 'green'
    },
  };
```
**触发搜索事件：**

```js
onSearch(search) {
  //模拟数据库查询数据
  //这个search应该是传到后台,然后台来根据条件查询数据库
  alert('查询条件：'+JSON.stringify(search,null,4));
}
```


""";

void main() {
  final controller = ScrollController();

  runApp(
    MaterialApp(
      title: "Markdown Demo",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Markdown Demo'),
        ),
        body: SafeArea(
          child: Markdown(
            syntaxHighlighter: DefaultSyntaxHighlighter(defaultLanguage: 'java'),
            controller: controller,
            selectable: true,
            data: _markdownData,
            imageDirectory: 'https://raw.githubusercontent.com',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () => controller.animateTo(0,
              duration: Duration(seconds: 1), curve: Curves.easeOut),
        ),
      ),
    ),
  );
}
