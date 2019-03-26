library(orthopolynom)


### Name: orthonormal.polynomials
### Title: Create orthonormal polynomials
### Aliases: orthonormal.polynomials
### Keywords: math

### ** Examples

###
### generate a data frame with the recurrences parameters for normalized T Chebyshev
### polynomials of orders 0 to 10
###
r <- chebyshev.t.recurrences( 10, normalized=TRUE )
print( r )
norm <- sqrt( pi )
###
### create the order 0 orthonormal polynomial
###
p.0 <- polynomial( c( 1 / norm ) )
###
### generate a list of orthonormal polynomial objects
###
p.list <- orthonormal.polynomials( r, p.0 )
print( p.list )



