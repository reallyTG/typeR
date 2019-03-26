library(orthopolynom)


### Name: chebyshev.t.polynomials
### Title: Create list of Chebyshev polynomials
### Aliases: chebyshev.t.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized T Chebyshev polynomials of orders 0 to 10
###
normalized.p.list <- chebyshev.t.polynomials( 10, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of unnormalized T Chebyshev polynomials of orders 0 to 10
###
unnormalized.p.list <- chebyshev.t.polynomials( 10, normalized=FALSE )
print( unnormalized.p.list )



