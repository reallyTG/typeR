library(dbplyr)


### Name: sql_expr
### Title: Generate SQL from R expressions
### Aliases: sql_expr

### ** Examples

sql_expr(f(x + 1))

sql_expr(f("x", "y"))
sql_expr(f(x, y))

sql_expr(cast("x" %as% DECIMAL))
sql_expr(round(x) %::% numeric)



