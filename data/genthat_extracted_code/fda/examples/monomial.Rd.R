library(fda)


### Name: monomial
### Title: Evaluate Monomial Basis
### Aliases: monomial
### Keywords: smooth

### ** Examples


# set up a monomial basis for the first five powers
nbasis   <- 5
basisobj <- create.monomial.basis(c(-1,1),nbasis)
#  evaluate the basis
tval <- seq(-1,1,0.1)
basismat <- monomial(tval, 1:basisobj$nbasis)




