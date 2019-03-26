library(orthopolynom)


### Name: jacobi.p.polynomials
### Title: Create list of Jacobi polynomials
### Aliases: jacobi.p.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized Jacobi P polynomials of orders 0 to 10
### first parameter value a is 2 and second parameter value b is 2
###
normalized.p.list <- jacobi.p.polynomials( 10, 2, 2, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of unnormalized Jacobi P polynomials of orders 0 to 10
### first parameter value a is 2 and second parameter value b is 2
###
unnormalized.p.list <- jacobi.p.polynomials( 10, 2, 2, normalized=FALSE )
print( unnormalized.p.list )



