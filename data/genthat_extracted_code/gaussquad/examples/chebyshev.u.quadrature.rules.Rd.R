library(gaussquad)


### Name: chebyshev.u.quadrature.rules
### Title: Create list of Chebyshev quadrature rules
### Aliases: chebyshev.u.quadrature.rules
### Keywords: math

### ** Examples

###
### generate the list of quadrature rules for
### the Chebyshev U orthogonal polynomials for
### orders 1 to 5
###
orthogonal.rules <- chebyshev.u.quadrature.rules( 5 )
print( orthogonal.rules )
###
### generate the list of quadrature rules for
### the Chebyshev U orthonormal polynomials for
### orders 1 to 5
###
orthonormal.rules <- chebyshev.u.quadrature.rules( 5, TRUE )
print( orthonormal.rules )



