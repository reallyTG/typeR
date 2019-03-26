library(rpn)


### Name: rpn
### Title: Reverse Polish Notation converter/interpreter.
### Aliases: rpn

### ** Examples

# simple example
r = c("4", "6", "*", "6", "+")
rpn(r)
rpn(r, eval = FALSE)

# the same example but with a variable
r = c("x", "6", "*", "6", "+")
rpn(r, eval = TRUE, vars = list(x = 4))
rpn(r, eval = FALSE)

# now a more complex expression with variables and custom operators/functions
rpe = c("x", "5", "6.4", "mysum", "5", "mystuff")
mysum = function(x, y, z) x + y + z # arity 3 and no infix operation
mystuff = function(x, y) 2 * (x + y) # arity 2 and no infix operation
ops = list(mysum = list(3, FALSE, mysum), mystuff = list(2, FALSE, mystuff))
vars = list(x = 3.6)
res = rpn(rpe, ops = ops, vars = vars)




