library(ucminf)


### Name: ucminf
### Title: General-Purpose Unconstrained Non-Linear Optimization
### Aliases: ucminf
### Keywords: optimize nonlinear

### ** Examples

## Rosenbrock Banana function
fR <- function(x) (1 - x[1])^2 + 100 * (x[2] - x[1]^2)^2
gR <- function(x) c(-400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
                     200 * (x[2] - x[1] * x[1]))

#  Find minimum and show trace
ucminf(par = c(2,.5), fn = fR, gr = gR, control = list(trace = 1))



