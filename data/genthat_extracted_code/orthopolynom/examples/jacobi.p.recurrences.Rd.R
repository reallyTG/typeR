library(orthopolynom)


### Name: jacobi.p.recurrences
### Title: Recurrence relations for Jacobi polynomials
### Aliases: jacobi.p.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrences data frame for 
### the normalized Jacobi P polynomials
### of orders 0 to 10.
### parameter a is 2 and parameter b is 2
###
normalized.r <- jacobi.p.recurrences( 10, 2, 2, normalized=TRUE )
print( normalized.r )
###
### generate the recurrences data frame for 
### the unnormalized Jacobi P polynomials
### of orders 0 to 10.
### parameter a is 2 and parameter b is 2
###
unnormalized.r <- jacobi.p.recurrences( 10, 2, 2, normalized=FALSE )
print( unnormalized.r )



