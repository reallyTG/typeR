library(HyperbolicDist)


### Name: gigMom
### Title: Calculate Moments of the Generalized Inverse Gaussian
###   Distribution
### Aliases: gigMom gigRawMom gammaRawMom
### Keywords: distribution

### ** Examples

### Raw moments of the generalized inverse Gaussian distribution
Theta <- c(-0.5,5,2.5)
gigRawMom(1, Theta)
momIntegrated("gig", order = 1, param = Theta, about = 0)
gigRawMom(2, Theta)
momIntegrated("gig", order = 2, param = Theta, about = 0)
gigRawMom(10, Theta)
momIntegrated("gig", order = 10, param = Theta, about = 0)
gigRawMom(2.5, Theta)

### Moments of the generalized inverse Gaussian distribution
Theta <- c(-0.5,5,2.5)
(m1 <- gigRawMom(1, Theta))
gigMom(1, Theta)
gigMom(2, Theta, m1)
(m2 <- momIntegrated("gig", order = 2, param = Theta, about = m1))
gigMom(1, Theta, m1)
gigMom(3, Theta, m1)
momIntegrated("gig", order = 3, param = Theta, about = m1)

### Raw moments of the gamma distribution
shape <- 2
rate <- 3
Theta <- c(shape, rate)
gammaRawMom(1, shape, rate)
momIntegrated("gamma", order = 1, param = Theta, about = 0)
gammaRawMom(2, shape, rate)
momIntegrated("gamma", order = 2, param = Theta, about = 0)
gammaRawMom(10, shape, rate)
momIntegrated("gamma", order = 10, param = Theta, about = 0)

### Moments of the inverse gamma distribution
Theta <- c(-0.5,5,0)
gigRawMom(2, Theta)              # Inf
gigRawMom(-2, Theta)
momIntegrated("invgamma", order = -2,
              param = c(-Theta[1],Theta[2]/2), about = 0)

### An example where the moment is infinite: inverse gamma
Theta <- c(-0.5,5,0)
gigMom(1, Theta)
gigMom(2, Theta)



