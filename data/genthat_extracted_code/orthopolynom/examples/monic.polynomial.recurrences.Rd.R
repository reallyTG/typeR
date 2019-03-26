library(orthopolynom)


### Name: monic.polynomial.recurrences
### Title: Create data frame of monic recurrences
### Aliases: monic.polynomial.recurrences
### Keywords: math

### ** Examples

###
### construct a list of the recurrences for the T Chebyshev polynomials of
### orders 0 to 10
###
r <- chebyshev.t.recurrences( 10, normalized=TRUE )
###
### construct the monic polynomial recurrences from the above list
###
m.r <- monic.polynomial.recurrences( r )



