library(orthopolynom)


### Name: jacobi.g.recurrences
### Title: Recurrence relations for Jacobi polynomials
### Aliases: jacobi.g.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrences data frame for 
### the normalized Jacobi G polynomials
### of orders 0 to 10.
### parameter p is 3 and parameter q is 2
###
normalized.r <- jacobi.g.recurrences( 10, 3, 2, normalized=TRUE )
print( normalized.r )
###
### generate the recurrences data frame for 
### the normalized Jacobi G polynomials
### of orders 0 to 10.
### parameter p is 3 and parameter q is 2
###
unnormalized.r <- jacobi.g.recurrences( 10, 3, 2, normalized=FALSE )
print( unnormalized.r )



