library(fastGHQuad)


### Name: fastGHQuad-package
### Title: A package for fast, numerically-stable computation of
###   Gauss-Hermite quadrature rules
### Aliases: fastGHQuad-package fastGHQuad
### Keywords: package

### ** Examples


# Get quadrature rule
rule <- gaussHermiteData(1000)

# Find a normalizing constant
g <- function(x) 1/(1+x^2/10)^(11/2) # t distribution with 10 df
aghQuad(g, 0, 1.1, rule)
# actual is
1/dt(0,10)

# Find an expectation
g <- function(x) x^2*dt(x,10) # t distribution with 10 df
aghQuad(g, 0, 1.1, rule)
# actual is 1.25




