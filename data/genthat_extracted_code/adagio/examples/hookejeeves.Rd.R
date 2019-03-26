library(adagio)


### Name: hookejeeves
### Title: Hooke-Jeeves Minimization Method
### Aliases: hookejeeves
### Keywords: optimize

### ** Examples

##  Rosenbrock function
rosenbrock <- function(x) {
    n <- length(x)
    x1 <- x[2:n]
    x2 <- x[1:(n-1)]
    sum(100*(x1-x2^2)^2 + (1-x2)^2)
}

hookejeeves(c(0,0,0,0), rosenbrock)
# $xmin
# [1] 1.000000 1.000001 1.000002 1.000004
# $fmin
# [1] 4.774847e-12
# $fcalls
# [1] 2499
# $niter
#[1] 26

hookejeeves(rep(0,4), lb=rep(-1,4), ub=0.5, rosenbrock)
# $xmin
# [1] 0.50000000 0.26221320 0.07797602 0.00608027
# $fmin
# [1] 1.667875
# $fcalls
# [1] 571
# $niter
# [1] 26



