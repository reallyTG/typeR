library(orthopolynom)


### Name: schebyshev.t.polynomials
### Title: Create list of shifted Chebyshev polynomials
### Aliases: schebyshev.t.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized shifted T Chebyshev polynomials of orders 0 to 10
###
normalized.p.list <- schebyshev.t.polynomials( 10, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of unnormalized shifted T Chebyshev polynomials of orders 0 to 10
###
unnormalized.p.list <- schebyshev.t.polynomials( 10, normalized=FALSE )
print( unnormalized.p.list )



