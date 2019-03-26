library(pracma)


### Name: steep_descent
### Title: Steepest Descent Minimization
### Aliases: steep_descent
### Keywords: optimize

### ** Examples

##  Rosenbrock function: The flat valley of the Rosenbruck function makes
##  it infeasible for a steepest descent approach.
# rosenbrock <- function(x) {
#     n <- length(x)
#     x1 <- x[2:n]
#     x2 <- x[1:(n-1)]
#     sum(100*(x1-x2^2)^2 + (1-x2)^2)
# }
# steep_descent(c(1, 1), rosenbrock)
# Warning message:
# In steep_descent(c(0, 0), rosenbrock) :
#   Maximum number of iterations reached -- not converged.

## Sphere function
sph <- function(x) sum(x^2)
steep_descent(rep(1, 10), sph)
# $xmin   0 0 0 0 0 0 0 0 0 0
# $fmin   0
# $niter  2



