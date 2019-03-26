library(gaussquad)


### Name: ghermite.h.quadrature.rules
### Title: Create list of generalized Hermite quadrature rules
### Aliases: ghermite.h.quadrature.rules
### Keywords: math

### ** Examples

###
### generate a list of quadrature rule data frames for
### the generalized orthogonal Hermite polynomial
### of orders 1 to 5.
### polynomial parameter mu is 1.0
###
orthogonal.rules <- ghermite.h.quadrature.rules( 5, 1 )
print( orthogonal.rules )
###
### generate a list of quadrature rule data frames for
### the generalized orthonormal Hermite polynomial
### of orders 1 to 5.
### polynomial parameter mu is 1.0
###
orthonormal.rules <- ghermite.h.quadrature.rules( 5, 1, TRUE )
print( orthonormal.rules )



