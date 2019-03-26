library(orthopolynom)


### Name: schebyshev.u.polynomials
### Title: Create list of shifted Chebyshev polynomials
### Aliases: schebyshev.u.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized shifted U Chebyshev polynomials of orders 0 to 10
###
normalized.p.list <- schebyshev.u.polynomials( 10, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of unnormalized shifted U Chebyshev polynomials of orders 0 to 10
###
unnormalized.p.list <- schebyshev.u.polynomials( 10, normalized=FALSE )
print( unnormalized.p.list )



