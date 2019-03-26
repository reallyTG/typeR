library(lpmodeler)


### Name: mipSolve
### Title: Solve a LP or a MIP
### Aliases: mipSolve

### ** Examples

# create and solve the following linear program:
# Simple mixed integer linear program.
# max:   3 x1 + 1 x2 + 3 x3
# s.t.: -1 x1 + 2 x2 +   x3 <= 4
#               4 x2 - 3 x3 <= 2
#          x1 - 3 x2 + 2 x3 <= 3
#          x1 >= 0 (integer)
#          x2 >= 0 (real)
#          x3 >= 0 (integer)
p <- newProblem()
p <- addVariable(p, "I", 3)
p <- addVariable(p, "C", 1)
p <- addVariable(p, "I", 3)
p <- addConstraint(p, "<=", 4, c(-1, 2, 1))
p <- addConstraint(p, "<=", 2, c(0, 4, -3))
p <- addConstraint(p, "<=", 3, c(1, -3, 2))
p <- addConstraint(p, ">=", 0, c(1, 0, 0))
p <- addConstraint(p, ">=", 0, c(0, 1, 0))
p <- addConstraint(p, ">=", 0, c(0, 0, 1))

if(require(Rsymphony))
  mipSolve(p)



