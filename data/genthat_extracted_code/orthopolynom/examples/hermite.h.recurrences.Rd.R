library(orthopolynom)


### Name: hermite.h.recurrences
### Title: Recurrence relations for Hermite polynomials
### Aliases: hermite.h.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrences data frame for 
### the normalized Hermite H polynomials
### of orders 0 to 10.
###
normalized.r <- hermite.h.recurrences( 10, normalized=TRUE )
print( normalized.r )
###
### generate the recurrences data frame for 
### the unnormalized Hermite H polynomials
### of orders 0 to 10.
###
unnormalized.r <- hermite.h.recurrences( 10, normalized=FALSE )
print( unnormalized.r )



