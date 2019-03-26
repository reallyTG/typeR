library(HyperbolicDist)


### Name: ghypChangePars
### Title: Change Parameterizations of the Generalized Hyperbolic
###   Distribution
### Aliases: ghypChangePars
### Keywords: distribution

### ** Examples

Theta1 <- c(2,2,1,3,0)                   # Parameterization 1
Theta2 <- ghypChangePars(1, 2, Theta1)   # Convert to parameterization 2
Theta2                                   # Parameterization 2
ghypChangePars(2, 1, as.numeric(Theta2)) # Convert back to parameterization 1



