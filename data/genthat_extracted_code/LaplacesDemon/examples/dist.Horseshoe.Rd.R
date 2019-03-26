library(LaplacesDemon)


### Name: dist.Horseshoe
### Title: Horseshoe Distribution
### Aliases: dhs rhs
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- rnorm(100)
lambda <- rhalfcauchy(100, 5)
tau <- 5
x <- dhs(x, lambda, tau, log=TRUE)
x <- rhs(100, lambda=lambda, tau=tau)
plot(density(x))



