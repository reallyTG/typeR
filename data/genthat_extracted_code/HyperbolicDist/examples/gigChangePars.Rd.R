library(HyperbolicDist)


### Name: gigChangePars
### Title: Change Parameterizations of the Generalized Inverse Gaussian
###   Distribution
### Aliases: gigChangePars
### Keywords: distribution

### ** Examples

Theta1 <- c(-0.5,5,2.5)                 # Parameterisation 1
Theta2 <- gigChangePars(1, 2, Theta1)   # Convert to parameterization 2
Theta2                                  # Parameterization 2
gigChangePars(2, 1, as.numeric(Theta2)) # Convert back to parameterization 1



