library(rmutil)


### Name: lin.diff.eqn
### Title: Solution of Autonomous Linear Differential Equations
### Aliases: lin.diff.eqn
### Keywords: math

### ** Examples

a <- matrix(c(1,0,1,0,0,0,0,0,-1),ncol=3,byrow=TRUE)
x <- c(5,7,6)
lin.diff.eqn(a,x,1)
# function giving the exact solution
exact <- function(t) c(8*exp(t)-3*exp(-t),7,6*exp(-t))
exact(1)



