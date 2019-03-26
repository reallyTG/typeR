library(nloptr)


### Name: stogo
### Title: Stochastic Global Optimization
### Aliases: stogo

### ** Examples


### Rosenbrock Banana objective function
fn <- function(x)
    return( 100 * (x[2] - x[1] * x[1])^2 + (1 - x[1])^2 )

x0 <- c( -1.2, 1 )
lb <- c( -3, -3 )
ub <- c(  3,  3 )

stogo(x0 = x0, fn = fn, lower = lb, upper = ub)




