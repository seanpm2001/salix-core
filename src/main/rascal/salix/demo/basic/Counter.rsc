@license{
  Copyright (c) Tijs van der Storm <Centrum Wiskunde & Informatica>.
  All rights reserved.
  This file is licensed under the BSD 2-Clause License, which accompanies this project
  and is available under https://opensource.org/licenses/BSD-2-Clause.
}
@contributor{Tijs van der Storm - storm@cwi.nl - CWI}

module salix::demo::basic::Counter

import salix::App;
import salix::HTML;
import salix::Index;


SalixApp[Model] counterApp(str id = "root") 
  = makeApp(id, init, withIndex("Counter", id, view), update);

App[Model] counterWebApp()
  = webApp(
      counterApp(),
      |project://salix/src/main/rascal|
    );


alias Model = tuple[int count];

Model init() = <0>;

data Msg = inc() | dec();

Model update(Msg msg, Model m) {
  switch (msg) {
    case inc(): m.count += 1;
    case dec(): m.count -= 1;
  }
  return m;
}

void view(Model m) {
  h2(id("header"), "My first counter app in Rascal");
  button(onClick(inc()), "+");
  div(id("thecount"), "<m.count>");
  button(onClick(dec()), "-");	
}

