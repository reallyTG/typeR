library(GeneralizedHyperbolic)


### Name: ghypChangePars
### Title: Change Parameterizations of the Generalized Hyperbolic
###   Distribution
### Aliases: ghypChangePars
### Keywords: distribution

### ** Examples

param1 <- c(0, 3, 2, 1, 2)               # Parameterization 1
param2 <- ghypChangePars(1, 2, param1)   # Convert to parameterization 2
param2                                   # Parameterization 2
ghypChangePars(2, 1, param2)             # Back to parameterization 1



