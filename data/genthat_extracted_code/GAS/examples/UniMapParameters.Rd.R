library(GAS)


### Name: UniMapParameters
### Title: Mapping function for univariate distributions
### Aliases: UniMapParameters

### ** Examples

# Map unrestricted parameters for the Student-t distribution.
library("GAS")

Dist = "std"

# Vector of unconditional reparametrised parameters such that,
# Theta = c(0, 1.5 ,7), i.e., location = 0, scale = 1.5,
# degrees of freedom = 7.

# LowerNu() prints the lower bound numerical parameter for the degree
# of freedom, see help(LowerNu).

Theta_tilde = c(0.1, log(1.5), log(7 - LowerNu()))

Theta = UniMapParameters(Theta_tilde, Dist)

Theta



