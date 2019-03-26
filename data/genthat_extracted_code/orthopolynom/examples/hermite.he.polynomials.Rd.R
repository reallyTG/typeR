library(orthopolynom)


### Name: hermite.he.polynomials
### Title: Create list of Hermite polynomials
### Aliases: hermite.he.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized Hermite polynomials of orders 0 to 10
###
normalized.p.list <- hermite.he.polynomials( 10, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of unnormalized Hermite polynomials of orders 0 to 10
###
unnormalized.p.list <- hermite.he.polynomials( 10, normalized=FALSE )
print( unnormalized.p.list )



