library(GeneralizedHyperbolic)


### Name: gigMom
### Title: Calculate Moments of the Generalized Inverse Gaussian
###   Distribution
### Aliases: gigMom gigRawMom gammaRawMom
### Keywords: distribution

### ** Examples

## Computations, using momIntegrated from pkg 'DistributionUtils':
momIntegrated <- DistributionUtils :: momIntegrated

### Raw moments of the generalized inverse Gaussian distribution
param <- c(5, 2.5, -0.5)
gigRawMom(1, param = param)
momIntegrated("gig", order = 1, param = param, about = 0)
gigRawMom(2, param = param)
momIntegrated("gig", order = 2, param = param, about = 0)
gigRawMom(10, param = param)
momIntegrated("gig", order = 10, param = param, about = 0)
gigRawMom(2.5, param = param)

### Moments of the generalized inverse Gaussian distribution
param <- c(5, 2.5, -0.5)
(m1 <- gigRawMom(1, param = param))
gigMom(1, param = param)
gigMom(2, param = param, about = m1)
(m2 <- momIntegrated("gig", order = 2, param = param, about = m1))
gigMom(1, param = param, about = m1)
gigMom(3, param = param, about = m1)
momIntegrated("gig", order = 3, param = param, about = m1)

### Raw moments of the gamma distribution
shape <- 2
rate <- 3
param <- c(shape, rate)
gammaRawMom(1, shape, rate)
momIntegrated("gamma", order = 1, shape = shape, rate = rate, about = 0)
gammaRawMom(2, shape, rate)
momIntegrated("gamma", order = 2, shape = shape, rate = rate, about = 0)
gammaRawMom(10, shape, rate)
momIntegrated("gamma", order = 10, shape = shape, rate = rate, about = 0)

### Moments of the inverse gamma distribution
param <- c(5, 0, -0.5)
gigRawMom(2, param = param)             # Inf
gigRawMom(-2, param = param)
momIntegrated("invgamma", order = -2, shape = -param[3],
              rate = param[1]/2, about = 0)

### An example where the moment is infinite: inverse gamma
param <- c(5, 0, -0.5)
gigMom(1, param = param)
gigMom(2, param = param)



