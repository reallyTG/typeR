library(DiscreteWeibull)


### Name: loglikedw
### Title: Loglikelihood function
### Aliases: loglikedw
### Keywords: distribution htest

### ** Examples

x <- c(1,1,1,2,2,2,2,2,2,3,4,4,5,6,8)
-loglikedw(c(0.8, 1), x) # loglikelihood function for q=0.8 and beta=1
-loglikedw(c(0.4, 2), x) # loglikelihood function for q=0.4 and beta=2
par <- estdweibull(x, "ML")# parameter estimates derived by the ML method
par
-loglikedw(par, x) # the maximum value of the loglikelihood function



