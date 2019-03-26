library(lazyeval)


### Name: expr_label
### Title: Find the expression associated with an argument
### Aliases: expr_label expr_text expr_find expr_env

### ** Examples

# Unlike substitute(), expr_find() finds the original expression
f <- function(x) g(x)
g <- function(y) h(y)
h <- function(z) list(substitute(z), expr_find(z))

f(1 + 2 + 3)

expr_label(10)
# Names a quoted with ``
expr_label(x)
# Strings are encoded
expr_label("a\nb")
# Expressions are captured
expr_label(a + b + c)
# Long expressions are collapsed
expr_label(foo({
  1 + 2
  print(x)
}))



