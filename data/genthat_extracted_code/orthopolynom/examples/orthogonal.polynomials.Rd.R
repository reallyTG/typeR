library(orthopolynom)


### Name: orthogonal.polynomials
### Title: Create orthogonal polynomials
### Aliases: orthogonal.polynomials
### Keywords: math

### ** Examples

###
### generate the recurrence relations for T Chebyshev polynomials of orders 0 to 10
###
r <- chebyshev.t.recurrences( 10, normalized=FALSE )
print( r )
###
### generate the list of orthogonal polynomials
###
p.list <- orthogonal.polynomials( r )
print( p.list )



