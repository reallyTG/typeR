library(ecotoxicology)


### Name: Probitw
### Title: Calculate weighting coefficient from expected probit
### Aliases: Probitw

### ** Examples

# Example from page 90 of Finney 1964:
# expected probit Y = 6.2, control mortality C = 59%
Y <- 6.2
C <- 0.59
# weighting coefficient = 0.141
Probitw(Y,C)



