library(orthopolynom)


### Name: glaguerre.polynomials
### Title: Create list of generalized Laguerre polynomials
### Aliases: glaguerre.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized generalized Laguerre polynomials of orders 0 to 10
### polynomial parameter is 1.0
###
normalized.p.list <- glaguerre.polynomials( 10, 1, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of unnormalized generalized Laguerre polynomials of orders 0 to 10
### polynomial parameter is 1.0
###
unnormalized.p.list <- glaguerre.polynomials( 10, 1, normalized=FALSE )



