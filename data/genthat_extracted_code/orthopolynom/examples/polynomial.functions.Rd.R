library(orthopolynom)


### Name: polynomial.functions
### Title: Coerce polynomials to functions
### Aliases: polynomial.functions
### Keywords: math

### ** Examples

###
### generate a list of T Chebyshev polynomials of
### orders 0 to 10
###
p.list <- chebyshev.t.polynomials( 10, normalized=FALSE )
###
### create the list of functions for each polynomial
###
f.list <- polynomial.functions( p.list )



