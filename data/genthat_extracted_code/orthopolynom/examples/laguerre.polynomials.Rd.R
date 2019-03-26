library(orthopolynom)


### Name: laguerre.polynomials
### Title: Create list of Laguerre polynomials
### Aliases: laguerre.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized Laguerre polynomials of orders 0 to 10
###
normalized.p.list <- laguerre.polynomials( 10, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of unnormalized Laguerre polynomials of orders 0 to 10
###
unnormalized.p.list <- laguerre.polynomials( 10, normalized=FALSE )
print( unnormalized.p.list )



