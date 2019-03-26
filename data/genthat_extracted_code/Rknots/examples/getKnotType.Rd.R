library(Rknots)


### Name: getKnotType
### Title: Given a polynomial invariant, obtain information on the knot
###   type
### Aliases: getKnotType
### Keywords: utilities

### ** Examples

#suppose you obtain the following HOMFLY polynomial (e.g. via computeInvariant)
polynomial <- 'l^(-4) - 1/l^2 + l^2 - m^2 - m^2/l^2'
getKnotType(polynomial = polynomial, invariant='HOMFLY')
#get more information of the Stevedore's knot
getKnotType(polynomial = polynomial, invariant='HOMFLY', full.output = TRUE)



