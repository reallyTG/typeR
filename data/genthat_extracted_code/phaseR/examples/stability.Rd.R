library(phaseR)


### Name: stability
### Title: Stability Analysis
### Aliases: stability

### ** Examples

# Determine the stability of the equilibrium points of the one dimensional
# autonomous ODE system example2.
example2.stability.1 <- stability(example2, ystar = 0, system = "one.dim")
example2.stability.2 <- stability(example2, ystar = 1, system = "one.dim")
example2.stability.3 <- stability(example2, ystar = 2, system = "one.dim")

# Determine the stability of the equilibrium points of the two dimensional autonomous
# ODE system example11.
example11.stability.1 <- stability(example11, ystar = c(0, 0))
example11.stability.2 <- stability(example11, ystar = c(0, 2))
example11.stability.3 <- stability(example11, ystar = c(1, 1))
example11.stability.4 <- stability(example11, ystar = c(3, 0))




