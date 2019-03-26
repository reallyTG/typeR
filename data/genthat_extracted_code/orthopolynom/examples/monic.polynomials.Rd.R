library(orthopolynom)


### Name: monic.polynomials
### Title: Create list of monic orthogonal polynomials
### Aliases: monic.polynomials
### Keywords: math

### ** Examples

###
### generate the recurrences for the T Chebyshev polynomials
### of orders 0 to 10
###
r <- chebyshev.t.recurrences( 10, normalized=TRUE )
###
### get the corresponding monic polynomial recurrences
###
m.r <- monic.polynomial.recurrences( r )
###
### obtain the list of monic polynomials
###
p.list <- monic.polynomials( m.r )



