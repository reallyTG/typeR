library(orthopolynom)


### Name: legendre.polynomials
### Title: Create list of Legendre polynomials
### Aliases: legendre.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized Laguerre polynomials of orders 0 to 10
###
normalized.p.list <- legendre.polynomials( 10, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of unnormalized Laguerre polynomials of orders 0 to 10
###
unnormalized.p.list <- legendre.polynomials( 10, normalized=FALSE )
print( unnormalized.p.list )



