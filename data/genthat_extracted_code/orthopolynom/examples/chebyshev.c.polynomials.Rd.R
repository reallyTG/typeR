library(orthopolynom)


### Name: chebyshev.c.polynomials
### Title: Create list of Chebyshev polynomials
### Aliases: chebyshev.c.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized C Chebyshev polynomials of orders 0 to 10
###
normalized.p.list <- chebyshev.c.polynomials( 10, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of unnormalized C Chebyshev polynomials of orders 0 to 10
###
unnormalized.p.list <- chebyshev.c.polynomials( 10, normalized=FALSE )
print( unnormalized.p.list )



