library(orthopolynom)


### Name: ghermite.h.recurrences
### Title: Recurrence relations for generalized Hermite polynomials
### Aliases: ghermite.h.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrences data frame for 
### the normalized generalized Hermite polynomials
### of orders 0 to 10.
### polynomial parameter value is 1.0
###
normalized.r <- ghermite.h.recurrences( 10, 1, normalized=TRUE )
print( normalized.r )
###
### generate the recurrences data frame for 
### the unnormalized generalized Hermite polynomials
### of orders 0 to 10.
### polynomial parameter value is 1.0
###
unnormalized.r <- ghermite.h.recurrences( 10, 1, normalized=FALSE )
print( unnormalized.r )



