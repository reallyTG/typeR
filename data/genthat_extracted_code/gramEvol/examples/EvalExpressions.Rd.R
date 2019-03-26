library(gramEvol)


### Name: EvalExpressions
### Title: Evaluate a collection of Expressions
### Aliases: EvalExpressions

### ** Examples


A <- 1:6
B <- 1

EvalExpressions("A - B")

# a vector of text strings
exprs <- c("A + B", "A - B")
EvalExpressions(exprs, data.frame(A = A, B = B))

# a vector of expressions
exprs <- expression(A + B, A - B)
EvalExpressions(exprs, data.frame(A = A, B = B))



