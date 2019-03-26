library(gaussquad)


### Name: laguerre.quadrature.rules
### Title: Create list of Laguerre quadrature rules
### Aliases: laguerre.quadrature.rules
### Keywords: math

### ** Examples

###
### generate a list of the quadrature rule frames for
### the orthogonal Laguerre polynomials
### of orders 1 to 5
###
orthogonal.rules <- laguerre.quadrature.rules( 5 )
print( orthogonal.rules )
###
### generate a list of the quadrature rule frames for
### the orthonormal Laguerre polynomials
### of orders 1 to 5
###
orthonormal.rules <- laguerre.quadrature.rules( 5, TRUE )
print( orthonormal.rules )



