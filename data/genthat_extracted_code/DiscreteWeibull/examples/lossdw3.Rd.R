library(DiscreteWeibull)


### Name: lossdw3
### Title: Loss function
### Aliases: lossdw3
### Keywords: distribution

### ** Examples

n <- 25
c <- 1/3
beta <- 2/3
x <- rdweibull3(n, c, beta)
par <- estdweibull3(x, "M")
par
lossdw3(par, x)



