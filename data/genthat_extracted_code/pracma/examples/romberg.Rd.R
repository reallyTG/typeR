library(pracma)


### Name: romberg
### Title: Romberg Integration
### Aliases: romberg
### Keywords: math

### ** Examples

romberg(sin, 0, pi, tol = 1e-15)    #  2                 , rel.error 1e-15
romberg(exp, 0, 1,  tol = 1e-15)    #  1.718281828459044 , rel error 1e-15
                                    #  1.718281828459045 , i.e. exp(1) - 1

f <- function(x, p) sin(x) * cos(p*x)
romberg(f, 0, pi, p = 2)            #  2/3               , abs.err 1.5e-14
# value: -0.6666667, iter: 7, rel.error: 1e-12



