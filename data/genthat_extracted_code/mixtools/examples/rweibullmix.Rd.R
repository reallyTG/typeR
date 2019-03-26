library(mixtools)


### Name: rweibullmix
### Title: Simulate from Mixtures of Weibull distributions
### Aliases: rweibullmix
### Keywords: file

### ** Examples

n = 500 # sample size
m = 2 # nb components
lambda=c(0.4, 0.6)
shape <- c(0.5,5); scale <- c(1,20) # model parameters
set.seed(321)
x <- rweibullmix(n, lambda, shape, scale) # iid ~ weibull mixture

## histogram of the simulated data.
hist(x, col=8)



