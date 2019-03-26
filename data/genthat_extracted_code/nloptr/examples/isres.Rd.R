library(nloptr)


### Name: isres
### Title: Improved Stochastic Ranking Evolution Strategy
### Aliases: isres

### ** Examples


### Rosenbrock Banana objective function
fn <- function(x)
    return( 100 * (x[2] - x[1] * x[1])^2 + (1 - x[1])^2 )

x0 <- c( -1.2, 1 )
lb <- c( -3, -3 )
ub <- c(  3,  3 )

isres(x0 = x0, fn = fn, lower = lb, upper = ub)




