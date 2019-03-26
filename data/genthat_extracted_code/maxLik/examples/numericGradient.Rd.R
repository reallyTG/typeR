library(maxLik)


### Name: numericGradient
### Title: Functions to Calculate Numeric Derivatives
### Aliases: numericGradient numericHessian numericNHessian
### Keywords: math utilities

### ** Examples

# A simple example with Gaussian bell surface
f0 <- function(t0) exp(-t0[1]^2 - t0[2]^2)
numericGradient(f0, c(1,2))
numericHessian(f0, t0=c(1,2))

# An example with the analytic gradient
gradf0 <- function(t0) -2*t0*f0(t0)
numericHessian(f0, gradf0, t0=c(1,2))
# The results should be similar as in the previous case

# The central numeric derivatives are often quite precise
compareDerivatives(f0, gradf0, t0=1:2)
# The difference is around 1e-10



