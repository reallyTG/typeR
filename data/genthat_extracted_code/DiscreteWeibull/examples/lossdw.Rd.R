library(DiscreteWeibull)


### Name: lossdw
### Title: Loss function
### Aliases: lossdw
### Keywords: distribution

### ** Examples

x <- c(1,1,1,1,1,2,2,2,3,4)
lossdw(c(0.5, 1), x)
par <- estdweibull(x, "M") # parameter estimates derived by the method of moments
par
lossdw(par, x) # the loss is zero using these estimates



