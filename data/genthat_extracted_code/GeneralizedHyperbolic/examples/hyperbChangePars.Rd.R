library(GeneralizedHyperbolic)


### Name: hyperbChangePars
### Title: Change Parameterizations of the Hyperbolic Distribution
### Aliases: hyperbChangePars
### Keywords: distribution

### ** Examples

param1 <- c(2, 1, 3, 1)                    # Parameterization 1
param2 <- hyperbChangePars(1, 2, param1)   # Convert to parameterization 2
param2                                     # Parameterization 2
hyperbChangePars(2, 1, param2)             # Back to parameterization 1



