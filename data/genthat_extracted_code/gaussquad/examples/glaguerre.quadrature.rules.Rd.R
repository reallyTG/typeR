library(gaussquad)


### Name: glaguerre.quadrature.rules
### Title: Create list of generalized Laguerre quadrature rules
### Aliases: glaguerre.quadrature.rules
### Keywords: math

### ** Examples

###
### generate a list of quadrature rule data frames for
### the generalized orthogonal Laguerre polynomials
### of orders 1 to 5
### polynomial parameter is 1.0
###
orthogonal.rules <- glaguerre.quadrature.rules( 5, 1 )
print( orthogonal.rules )
###
### generate a list of quadrature rule data frames for
### the generalized orthonormal Laguerre polynomials
### of orders 1 to 5
### polynomial parameter is 1.0
###
orthonormal.rules <- glaguerre.quadrature.rules( 5, 1, TRUE )
print( orthonormal.rules )



