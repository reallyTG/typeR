library(orthopolynom)


### Name: polynomial.integrals
### Title: Create list of polynomial integrals
### Aliases: polynomial.integrals
### Keywords: math

### ** Examples

###
### generate a list of normalized T Chebyshev polynomials
### of orders 0 to 10
###
p.list <- chebyshev.t.polynomials( 10, normalized=TRUE )
###
### generate the corresponding list of polynomial integrals
###
p.int <- polynomial.integrals( p.list )



