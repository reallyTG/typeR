library(pracma)


### Name: gammaz
### Title: Complex Gamma Function
### Aliases: gammaz
### Keywords: specfun

### ** Examples

max(gamma(1:10) - gammaz(1:10))
gammaz(-1)
gammaz(c(-2-2i, -1-1i, 0, 1+1i, 2+2i))

# Euler's reflection formula
z <- 1+1i
gammaz(1-z) * gammaz(z)  # == pi/sin(pi*z)



