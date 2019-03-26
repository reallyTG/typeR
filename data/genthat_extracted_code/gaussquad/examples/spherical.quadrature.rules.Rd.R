library(gaussquad)


### Name: spherical.quadrature.rules
### Title: Create list of shperical quadrature rules
### Aliases: spherical.quadrature.rules
### Keywords: math

### ** Examples

###
### generate a list of quadrature rule data frames for
### the orthogonal spherical polynomials
### of orders 1 to 5
###
orthogonal.rules <- spherical.quadrature.rules( 5 )
print( orthogonal.rules )
###
### generate a list of quadrature rule data frames for
### the orthonormal spherical polynomials
### of orders 1 to 5
###
orthonormal.rules <- spherical.quadrature.rules( 5, TRUE )
print( orthonormal.rules )



