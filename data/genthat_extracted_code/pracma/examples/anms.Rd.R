library(pracma)


### Name: anms
### Title: Adaptive Nelder-Mead Minimization
### Aliases: anms
### Keywords: optimize

### ** Examples

##  Rosenbrock function
rosenbrock <- function(x) {
    n <- length(x)
    x1 <- x[2:n]
    x2 <- x[1:(n-1)]
    sum(100*(x1-x2^2)^2 + (1-x2)^2)
}

anms(rosenbrock, c(0,0,0,0,0))
# $xmin
# [1] 1 1 1 1 1
# $fmin
# [1] 8.268732e-21
# $nfeval
# [1] 1153



