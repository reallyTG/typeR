library(gaussquad)


### Name: chebyshev.c.quadrature.rules
### Title: Create list of Chebyshev quadrature rules
### Aliases: chebyshev.c.quadrature.rules
### Keywords: math

### ** Examples

###
### construct the list of quadrature rules for
### the Chebyshev orthogonal polynomials
### of orders 1 to 5
###
orthogonal.rules <- chebyshev.c.quadrature.rules( 5 )
print( orthogonal.rules )
###
### construct the list of quadrature rules for
### the Chebyshev orthonormal polynomials
### of orders 1 to 5
###
orthonormal.rules <- chebyshev.c.quadrature.rules( 5, TRUE )
print( orthonormal.rules )



