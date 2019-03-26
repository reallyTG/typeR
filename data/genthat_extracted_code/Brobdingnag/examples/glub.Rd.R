library(Brobdingnag)


### Name: glub
### Title: Glubbdubdribian numbers: complex numbers with Brobdingnagian
###   real and imaginary parts
### Aliases: glub as.glub is.glub
### Keywords: math

### ** Examples

a <- as.glub(1:10 + 5i)
a^2 - a*a

f <- function(x){sin(x) +x^4 - 1/x}
as.complex(f(a)) - f(as.complex(a))   # should be zero (in the first
                                      # term, f() works with glubs and coerces to
                                      # complex; in the second, f()
                                      # works with complex numbers directly)



