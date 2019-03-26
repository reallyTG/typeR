library(lazyeval)


### Name: ast_
### Title: Display a call (or expression) as a tree.
### Aliases: ast_ ast

### ** Examples

ast(f(x, 1, g(), h(i())))
ast(if (TRUE) 3 else 4)
ast(function(a = 1, b = 2) {a + b + 10})
ast(f(x)(y)(z))

ast_(quote(f(x, 1, g(), h(i()))))
ast_(quote(if (TRUE) 3 else 4))
ast_(expression(1, 2, 3))



