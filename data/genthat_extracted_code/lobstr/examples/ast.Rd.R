library(lobstr)


### Name: ast
### Title: Display the abstract syntax tree
### Aliases: ast

### ** Examples

# Leaves
ast(1)
ast(x)

# Simple calls
ast(f())
ast(f(x, 1, g(), h(i())))
ast(f()())
ast(f(x)(y))

ast((x + 1))

# Displaying expression already stored in object
x <- quote(a + b + c)
ast(x)
ast(!!x)

# All operations have this same structure
ast(if (TRUE) 3 else 4)
ast(y <- x * 10)
ast(function(x = 1, y = 2) { x + y } )

# Operator precedence
ast(1 * 2 + 3)
ast(!1 + !1)



