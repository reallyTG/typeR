library(orthopolynom)


### Name: chebyshev.s.polynomials
### Title: Create list of Chebyshev polynomials
### Aliases: chebyshev.s.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized S Chebyshev polynomials of orders 0 to 10
###
normalized.p.list <- chebyshev.s.polynomials( 10, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of unnormalized S Chebyshev polynomials of orders 0 to 10
###
unnormalized.p.list <- chebyshev.s.polynomials( 10, normalized=FALSE )
print( unnormalized.p.list )



