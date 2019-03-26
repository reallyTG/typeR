library(GeneralizedHyperbolic)


### Name: gigChangePars
### Title: Change Parameterizations of the Generalized Inverse Gaussian
###   Distribution
### Aliases: gigChangePars
### Keywords: distribution

### ** Examples

param1 <- c(2.5, 0.5, 5)                # Parameterisation 1
param2 <- gigChangePars(1, 2, param1)   # Convert to parameterization 2
param2                                  # Parameterization 2
gigChangePars(2, 1, as.numeric(param2)) # Convert back to parameterization 1



