library(orthopolynom)


### Name: spherical.recurrences
### Title: Recurrence relations for spherical polynomials
### Aliases: spherical.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrence relations for 
### the normalized spherical polynomials
### of orders 0 to 10
###
normalized.r <- spherical.recurrences( 10, normalized=TRUE )
print( normalized.r )
###
### generate the recurrence relations for 
### the unnormalized spherical polynomials
### of orders 0 to 10
###
unnormalized.r <- spherical.recurrences( 10, normalized=FALSE )
print( unnormalized.r )



