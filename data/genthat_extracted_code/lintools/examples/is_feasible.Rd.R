library(lintools)


### Name: is_feasible
### Title: Check feasibility of a system of linear (in)equations
### Aliases: is_feasible

### ** Examples

# An infeasible system:
# x + y == 0
# x > 0
# y > 0
A <- matrix(c(1,1,1,0,0,1),byrow=TRUE,nrow=3)
b <- rep(0,3)
is_feasible(A=A,b=b,neq=1,nleq=0)

# A feasible system:
# x + y == 0
# x >= 0
# y >= 0
A <- matrix(c(1,1,1,0,0,1),byrow=TRUE,nrow=3)
b <- rep(0,3)
is_feasible(A=A,b=b,neq=1,nleq=2)




