library(SqlRender)


### Name: render
### Title: Render SQL code based on parameterized SQL and parameter values
### Aliases: render

### ** Examples

render("SELECT * FROM @a;", a = "myTable")
render("SELECT * FROM @a {@b}?{WHERE x = 1};", a = "myTable", b = "true")
render("SELECT * FROM @a {@b == ''}?{WHERE x = 1}:{ORDER BY x};", a = "myTable", b = "true")
render("SELECT * FROM @a {@b != ''}?{WHERE @b = 1};", a = "myTable", b = "y")
render("SELECT * FROM @a {1 IN (@c)}?{WHERE @b = 1};",
       a = "myTable",
       b = "y",
       c = c(1, 2, 3, 4))
render("{DEFAULT @b = \"someField\"}SELECT * FROM @a {@b != ''}?{WHERE @b = 1};",
       a = "myTable")
render("SELECT * FROM @a {@a == 'myTable' & @b != 'x'}?{WHERE @b = 1};",
       a = "myTable",
       b = "y")
render(sql = "SELECT * FROM @a;", 
       warnOnMissingParameters = FALSE, 
       a = "myTable", 
       b = "missingParameter")



