library(GAS)


### Name: UniUnmapParameters
### Title: Unmapping function for univariate distributions, i.e. inverse of
###   UniMapParameters
### Aliases: UniUnmapParameters

### ** Examples

# Unmap parameters for the Student-t distribution
library("GAS")

Dist = "std"

# Vector of parameters such that,
# Theta = c(0, 1.5 ,7), i.e., location = 0, scale = 1.5,
# degrees of freedom = 7.

Theta = c(0.1, 1.5, 7)

Theta_tilde = UniUnmapParameters(Theta, Dist)

Theta_tilde

# It works.
all(abs(UniMapParameters(Theta_tilde, Dist) - Theta) < 1e-16)



