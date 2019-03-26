library(gaussquad)


### Name: hermite.h.quadrature.rules
### Title: Create list of Hermite quadrature rules
### Aliases: hermite.h.quadrature.rules
### Keywords: math

### ** Examples

###
### generate the list of quadrature rules for
### the Hermite orthogonal polynomials
### of orders 1 to 5
###
orthogonal.rules <- hermite.h.quadrature.rules( 5 )
print( orthogonal.rules )
###
### generate the list of quadrature rules for
### the Hermite orthonormal polynomials
### of orders 1 to 5
###
orthonormal.rules <- hermite.h.quadrature.rules( 5, TRUE )
print( orthonormal.rules )



