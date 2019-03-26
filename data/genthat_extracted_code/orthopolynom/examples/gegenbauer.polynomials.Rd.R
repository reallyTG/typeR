library(orthopolynom)


### Name: gegenbauer.polynomials
### Title: Create list of Gegenbauer polynomials
### Aliases: gegenbauer.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized Gegenbauer polynomials of orders 0 to 10
### polynomial parameter is 1.0
###
normalized.p.list <- gegenbauer.polynomials( 10, 1, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of unnormalized Gegenbauer polynomials of orders 0 to 10
### polynomial parameter is 1.0
###
unnormalized.p.list <- gegenbauer.polynomials( 10, 1, normalized=FALSE )
print( unnormalized.p.list )



