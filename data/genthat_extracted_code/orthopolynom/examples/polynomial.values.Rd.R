library(orthopolynom)


### Name: polynomial.values
### Title: Create vector of polynomial values
### Aliases: polynomial.values
### Keywords: math

### ** Examples

###
### generate a list of T Chebyshev polynomials of
### orders 0 to 10
###
p.list <- chebyshev.t.polynomials( 10, normalized=FALSE )
x <- seq( -2, 2, .01 )
###
### compute the value of the polynomials for the given range of values in x
###
y <- polynomial.values( p.list, x )
print( y )



