library(DiscreteWeibull)


### Name: loglikedw3
### Title: Loglikelihood function
### Aliases: loglikedw3
### Keywords: distribution htest

### ** Examples

n <- 20
c <- 1/3
beta <- 2/3
x <- rdweibull3(n, c, beta)
par <- estdweibull3(x, "ML")
par
-loglikedw3(par, x)



