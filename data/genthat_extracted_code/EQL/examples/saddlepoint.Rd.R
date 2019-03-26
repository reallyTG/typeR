library(EQL)


### Name: saddlepoint
### Title: Saddlepoint Approximation
### Aliases: saddlepoint

### ** Examples

# Saddlepoint approximation for the density of the mean of n Gamma
# variables with shape=1 and scale=1
n <- 10
shape <- scale <- 1
x <- seq(0, 3, length=1000) 
sp <- saddlepoint(x, n, gammaCumulants(shape, scale))
plot(sp, lwd=2)

# Mean of n Gamma(1,1) variables is n*Gamma(n,1) distributed
lines(x, n*dgamma(n*x, shape=n*shape, scale=scale), col=2)




