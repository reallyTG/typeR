library(gaussquad)


### Name: chebyshev.s.quadrature.rules
### Title: Create list of Chebyshev quadrature rules
### Aliases: chebyshev.s.quadrature.rules
### Keywords: math

### ** Examples

###
### generate a list of quadrature rules for
### the Chebyshev S orthogonal polynomials
### for orders 1 to 5
###
orthogonal.rules <- chebyshev.s.quadrature.rules( 5 )
print( orthogonal.rules )
###
### generate a list of quadrature rules for
### the Chebyshev S orthogonal polynomials
### for orders 1 to 5
###
orthonormal.rules <- chebyshev.s.quadrature.rules( 5, TRUE )
print( orthonormal.rules )



