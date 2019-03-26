library(gaussquad)


### Name: schebyshev.t.quadrature.rules
### Title: Create list of shifted Chebyshev quadrature rules
### Aliases: schebyshev.t.quadrature.rules
### Keywords: math

### ** Examples

###
### construct a list of quadrature rule data frames for
### the shifted orthogonal Chebyshev T polynomials
### of orders 1 to 5
###
orthogonal.rules <- schebyshev.t.quadrature.rules( 5 )
print( orthogonal.rules )
###
### construct a list of quadrature rule data frames for
### the shifted orthonormal Chebyshev T polynomials
### of orders 1 to 5
###
orthonormal.rules <- schebyshev.t.quadrature.rules( 5, TRUE )
print( orthonormal.rules )



