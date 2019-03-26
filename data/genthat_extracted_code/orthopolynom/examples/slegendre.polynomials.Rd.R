library(orthopolynom)


### Name: slegendre.polynomials
### Title: Create list of shifted Legendre polynomials
### Aliases: slegendre.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized shifted Legendre polynomials of orders 0 to 10
###
normalized.p.list <- slegendre.polynomials( 10, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of unnormalized shifted Legendre polynomials of orders 0 to 10
###
unnormalized.p.list <- slegendre.polynomials( 10, normalized=FALSE )
print( unnormalized.p.list )



