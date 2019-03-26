library(SimMultiCorrData)


### Name: calc_theory
### Title: Find Theoretical Standardized Cumulants for Continuous
###   Distributions
### Aliases: calc_theory
### Keywords: cumulants, theoretical

### ** Examples

options(scipen = 999)

# Pareto Distribution: params = c(alpha = scale, theta = shape)
calc_theory(Dist = "Pareto", params = c(1, 10))

# Generalized Rayleigh Distribution: params = c(alpha = scale, mu/sqrt(pi/2) = shape)
calc_theory(Dist = "Rayleigh", params = c(0.5, 1))

# Laplace Distribution: params = c(location, scale)
calc_theory(Dist = "Laplace", params = c(0, 1))

# Triangle Distribution: params = c(a, b)
calc_theory(Dist = "Triangular", params = c(0, 1))



