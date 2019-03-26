library(orthopolynom)


### Name: polynomial.orders
### Title: Create vector of polynomial orders
### Aliases: polynomial.orders
### Keywords: math

### ** Examples

###
### generate a list of normalized T Chebyshev polynomials
### of orders 0 to 10
###
p.list <- chebyshev.t.polynomials( 10, normalized=TRUE )
###
### get the vector of polynomial orders
###
p.order <- polynomial.orders( p.list )



