library(fastGHQuad)


### Name: aghQuad
### Title: Adaptive Gauss-Hermite quadrature using Laplace approximation
### Aliases: aghQuad
### Keywords: math

### ** Examples


# Get quadrature rules
rule10  <- gaussHermiteData(10)
rule100 <- gaussHermiteData(100)

# Estimating normalizing constants
g <- function(x) 1/(1+x^2/10)^(11/2) # t distribution with 10 df
aghQuad(g, 0, 1.1,  rule10)
aghQuad(g, 0, 1.1,  rule100)
# actual is
1/dt(0,10)

# Can work well even when the approximation is not exact
g <- function(x) exp(-abs(x)) # Laplace distribution
aghQuad(g, 0, 2,  rule10)
aghQuad(g, 0, 2,  rule100)
# actual is 2

# Estimating expectations
# Variances for the previous two distributions
g <- function(x) x^2*dt(x,10) # t distribution with 10 df
aghQuad(g, 0, 1.1,  rule10)
aghQuad(g, 0, 1.1,  rule100)
# actual is 1.25

# Can work well even when the approximation is not exact
g <- function(x) x^2*exp(-abs(x))/2 # Laplace distribution
aghQuad(g, 0, 2,  rule10)
aghQuad(g, 0, 2,  rule100)
# actual is 2





