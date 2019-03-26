library(hypergeo)


### Name: complex_gamma
### Title: Gamma function for complex arguments
### Aliases: complex_gamma complex_factorial lanczos

### ** Examples


complex_gamma(5)  # should be 4!=24

complex_gamma(1+1i)   # takes complex arguments

complex_gamma(-5/2) + sqrt(pi)*8/15  # should be small

z <- pi + 1i*sqrt(2)
complex_gamma(z+1)-z*complex_gamma(z)   # should be small


complex_gamma(z)*complex_gamma(1-z) - pi/sin(pi*z)  # small





