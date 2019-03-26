library(orthopolynom)


### Name: polynomial.coefficients
### Title: Create list of polynomial coefficient vectors
### Aliases: polynomial.coefficients
### Keywords: math

### ** Examples

###
### generate a list of normalized T Chebyshev polynomials
### of orders 0 to 10
###
p.list <- chebyshev.t.polynomials( 10, normalized=TRUE )
###
### obtain the list of coefficients for these polynomials
###
p.coef <- polynomial.coefficients( p.list )



