library(Ryacas)


### Name: Eval
### Title: Evaluate a yacas expression.
### Aliases: Eval Eval.Sym Eval.Expr Eval.yacas
### Keywords: symbolmath

### ** Examples

Eval(yacas(expression(x*x)), list(x=2))

# same
x <- 2
Eval(yacas(expression(x*x)))



