library(HyperbolicDist)


### Name: hyperbChangePars
### Title: Change Parameterizations of the Hyperbolic Distribution
### Aliases: hyperbChangePars
### Keywords: distribution

### ** Examples

Theta1 <- c(-2,1,3,0)                      # Parameterization 1
Theta2 <- hyperbChangePars(1, 2, Theta1)   # Convert to parameterization 2
Theta2                                     # Parameterization 2
hyperbChangePars(2, 1, as.numeric(Theta2)) # Convert back to parameterization 1



