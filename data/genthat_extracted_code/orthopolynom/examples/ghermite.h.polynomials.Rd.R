library(orthopolynom)


### Name: ghermite.h.polynomials
### Title: Create list of generalized Hermite polynomials
### Aliases: ghermite.h.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized generalized Hermite polynomials of orders 0 to 10
### polynomial parameter is 1.0
###
normalized.p.list <- ghermite.h.polynomials( 10, 1, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of unnormalized generalized Hermite polynomials of orders 0 to 10
### polynomial parameter is 1.0
###
unnormalized.p.list <- ghermite.h.polynomials( 10, 1, normalized=FALSE )
print( unnormalized.p.list )



