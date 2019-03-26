library(plde)


### Name: legendre_polynomial
### Title: legendre_polynomial
### Aliases: legendre_polynomial

### ** Examples

# clean up
rm(list = ls())
library(plde)
x = seq(-1, 1, length = 200)
L = legendre_polynomial(x, list(dimension = 10))
# Legendre polynomial basis for dimension 1 to 10
matplot(x, L, type = "l")



