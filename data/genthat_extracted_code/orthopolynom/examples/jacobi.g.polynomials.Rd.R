library(orthopolynom)


### Name: jacobi.g.polynomials
### Title: Create list of Jacobi polynomials
### Aliases: jacobi.g.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized Jacobi G polynomials of orders 0 to 10
### first parameter value p is 3 and second parameter value q is 2
###
normalized.p.list <- jacobi.g.polynomials( 10, 3, 2, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of normalized Jacobi G polynomials of orders 0 to 10
### first parameter value p is 3 and second parameter value q is 2
###
unnormalized.p.list <- jacobi.g.polynomials( 10, 3, 2, normalized=FALSE )
print( unnormalized.p.list )



