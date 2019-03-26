library(pracma)


### Name: chebCoeff
### Title: Chebyshev Polynomials
### Aliases: chebCoeff
### Keywords: math

### ** Examples

##  Chebyshev coefficients for x^2 + 1
n <- 4
f2 <- function(x) x^2 + 1
cC <- chebCoeff(f2, -1, 1, n)  #  3.0   0  0.5   0   0
cC[1] <- cC[1]/2               # correcting the absolute Chebyshev term
                               # i.e.  1.5*T_0 + 0.5*T_2
cP <- chebPoly(n)              # summing up the polynomial coefficients
p <- cC %*% cP                 #  0 0 1 0 1



