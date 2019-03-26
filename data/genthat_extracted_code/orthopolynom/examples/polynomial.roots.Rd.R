library(orthopolynom)


### Name: polynomial.roots
### Title: Create a list of polynomial roots
### Aliases: polynomial.roots
### Keywords: math

### ** Examples

###
### generate the recurrences data frame for
### the normalized Chebyshev polynomials of
### orders 0 to 10
###
r <- chebyshev.t.recurrences( 10, normalized=TRUE )
###
### construct the corresponding monic polynomial
### recurrences
###
m.r <- monic.polynomial.recurrences( r )
###
### obtain the polynomial roots from the monic polynomial
### recurrences
p.roots <- polynomial.roots( m.r )



