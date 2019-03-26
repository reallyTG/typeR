library(orthopolynom)


### Name: polynomial.derivatives
### Title: Create list of polynomial derivatives
### Aliases: polynomial.derivatives
### Keywords: math

### ** Examples

###
### generate a list of normalized T Chebyshev polynomials of
### orders 0 to 10
###
p.list <- chebyshev.t.polynomials( 10, normalized=TRUE )
###
### generate the corresponding list of polynomial derivatives
###
p.deriv <- polynomial.derivatives( p.list )



