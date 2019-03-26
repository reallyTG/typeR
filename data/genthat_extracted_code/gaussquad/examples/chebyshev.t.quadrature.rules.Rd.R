library(gaussquad)


### Name: chebyshev.t.quadrature.rules
### Title: Create list of Chebyshev quadrature rules
### Aliases: chebyshev.t.quadrature.rules
### Keywords: math

### ** Examples

###
### generate the list of quadrature rules for
### the orthogonal Chebyshev polynomials
### for orders 1 to 5
###
orthogonal.rules <- chebyshev.t.quadrature.rules( 5 )
print( orthogonal.rules )
###
### generate the list of quadrature rules for
### the orthonormal Chebyshev polynomials
### for orders 1 to 5
###
orthonormal.rules <- chebyshev.t.quadrature.rules( 5, normalized=TRUE )
print( orthonormal.rules )



