library(pracma)


### Name: cgmin
### Title: Conjugate Gradient Minimization
### Aliases: cgmin
### Keywords: optimize

### ** Examples

##  Rosenbrock function
rosenbrock <- function(x) {
    n <- length(x)
    x1 <- x[2:n]
    x2 <- x[1:(n-1)]
    sum(100*(x1-x2^2)^2 + (1-x2)^2)
}
cgmin(c(0, 0), rosenbrock)
# $xmin
# [1] 1 1
# $fmin
# [1] 1.774148e-27
# $niter
# [1] 14



