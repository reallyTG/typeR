library(gaussquad)


### Name: ultraspherical.quadrature.rules
### Title: Create list of ultraspherical quadrature rules
### Aliases: ultraspherical.quadrature.rules
### Keywords: math

### ** Examples

###
### generate a list of quadrature rules for
### the orthogonal ultraspherical polynomial
### of orders 1 to 5
### the polynomial parameter value alpha is 1.0
###
orthogonal.rules <- ultraspherical.quadrature.rules( 5, 1 )
print( orthogonal.rules )
###
### generate a list of quadrature rules for
### the orthonormal ultraspherical polynomial
### of orders 1 to 5
### the polynomial parameter value alpha is 1.0
###
orthonormal.rules <- ultraspherical.quadrature.rules( 5, 1, TRUE )
print( orthonormal.rules )



