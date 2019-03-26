library(pracma)


### Name: numderiv
### Title: Richardson's Numerical Derivative
### Aliases: numderiv numdiff
### Keywords: math

### ** Examples

# Differentiate an anti-derivative function
f <- function(x) sin(x)*sqrt(1+sin(x))
F <- function(x)
        integrate(f, 0, x, rel.tol = 1e-12)$value
x0 <- 1
dF0 <- numderiv(F, x0, tol = 6.5e-15)   #=> 1.141882942715462
f(x0)                                   #   1.141882942715464 true value
# fderiv(F, x0)                         #   1.141882942704476
# numDeriv::grad(F, x0)                 #   1.141882942705797

# Compare over a whole period
x <- seq(0, 2*pi, length.out = 11)
max(abs(numdiff(sin, x) - cos(x)))          #=> 3.44e-15
# max(abs(numDeriv::grad(sin, x) - cos(x))) #   7.70e-12

# Example from complex step
f <- function(x) exp(x) / sqrt(sin(x)^3 + cos(x)^3)
x0 <- 1.5
numderiv(f, x0)                          #   4.05342789389876, error 0.5e-12
                                         #   4.053427893898621... true value



