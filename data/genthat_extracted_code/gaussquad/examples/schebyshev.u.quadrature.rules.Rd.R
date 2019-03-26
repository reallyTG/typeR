library(gaussquad)


### Name: schebyshev.u.quadrature.rules
### Title: Create list of shifted Chebyshev quadrature rules
### Aliases: schebyshev.u.quadrature.rules
### Keywords: math

### ** Examples

###
### generate the quadrature rules for
### the shifted Chebyshev U orthogonal polynomials
### of orders 1 to 5
###
orthogonal.rules <- schebyshev.u.quadrature.rules( 5 )
print( orthogonal.rules )
###
### generate the quadrature rules for
### the shifted Chebyshev U orthonormal polynomials
### of orders 1 to 5
###
orthonormal.rules <- schebyshev.u.quadrature.rules( 5 )
print( orthonormal.rules )



