library(mixtools)


### Name: rnormmix
### Title: Simulate from Mixtures of Normals
### Aliases: normmix.sim rnormmix
### Keywords: file

### ** Examples

##Generate data from a 2-component mixture of normals.

set.seed(100)
n <- 500
lambda <- rep(1, 2)/2
mu <- c(0, 5)
sigma <- rep(1, 2)
mixnorm.data <- rnormmix(n, lambda, mu, sigma)

##A histogram of the simulated data.

hist(mixnorm.data)



