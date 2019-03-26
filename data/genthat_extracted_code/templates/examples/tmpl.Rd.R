library(templates)


### Name: tmpl
### Title: Template constructors
### Aliases: tmpl tmpl.character tmpl.formula tmpl.tmpl tmpl.function

### ** Examples


tmpl("Hi {{ toupper(a) }}!", a = "there")
tmpl( ~ {y <- {{ a }}}, a ~ x + 1)
tmpl(function(x) {{ a }} + x, a ~ 1)




