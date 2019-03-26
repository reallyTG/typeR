library(pryr)


### Name: call_tree
### Title: Display a call (or expression) as a tree.
### Aliases: call_tree ast

### ** Examples

call_tree(quote(f(x, 1, g(), h(i()))))
call_tree(quote(if (TRUE) 3 else 4))
call_tree(expression(1, 2, 3))

ast(f(x, 1, g(), h(i())))
ast(if (TRUE) 3 else 4)
ast(function(a = 1, b = 2) {a + b})
ast(f()()())



