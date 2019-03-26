library(ecotoxicology)


### Name: ProbitWeightingCoef
### Title: Calculate the weighting coefficient
### Aliases: ProbitWeightingCoef

### ** Examples

# Example from page 90 of Finney 1964:
# expected probit Y = 6.2, control mortality C = 59%
Y <- 6.2
C <- 0.59
P <- pnorm(Y-5)
Q <- 1-P
Z <- ProbitZ(Y)
# weighting coefficient = 0.141
ProbitWeightingCoef(Z,Q,P,C)



