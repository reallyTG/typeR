library(orthopolynom)


### Name: chebyshev.u.polynomials
### Title: Create list of Chebyshev polynomials
### Aliases: chebyshev.u.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized U Chebyshev polynomials of orders 0 to 10
###
normalized.p.list <- chebyshev.u.polynomials( 10, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of unnormalized T Chebyshev polynomials of orders 0 to 10
###
unnormalized.p.list <- chebyshev.u.polynomials( 10, normalized=FALSE )
print( unnormalized.p.list )



