library(gaussquad)


### Name: legendre.quadrature.rules
### Title: Create list of Legendre quadrature rules
### Aliases: legendre.quadrature.rules
### Keywords: math

### ** Examples

###
### generate a list of quadrature rule frames for
### the orthogonal Legendre polynomials
### of orders 1 to 5
###
orthogonal.rules <- legendre.quadrature.rules( 5 )
print( orthogonal.rules )
###
### generate a list of quadrature rule frames for
### the orthonormal Legendre polynomials
### of orders 1 to 5
###
orthonormal.rules <- legendre.quadrature.rules( 5, TRUE )
print( orthonormal.rules )



