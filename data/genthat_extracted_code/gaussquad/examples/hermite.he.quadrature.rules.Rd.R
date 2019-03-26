library(gaussquad)


### Name: hermite.he.quadrature.rules
### Title: Create list of Hermite quadrature rules
### Aliases: hermite.he.quadrature.rules
### Keywords: math

### ** Examples

###
### generate a list of quadrature rule frames for
### the Hermite orthogonal polynomials
### of orders 1 to 5
###
orthogonal.rules <- hermite.he.quadrature.rules( 5 )
print( orthogonal.rules )
###
### generate a list of quadrature rule frames for
### the Hermite orthonormal polynomials
### of orders 1 to 5
###
orthonormal.rules <- hermite.he.quadrature.rules( 5, TRUE )
print( orthonormal.rules )



