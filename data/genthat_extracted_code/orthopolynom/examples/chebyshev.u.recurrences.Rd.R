library(orthopolynom)


### Name: chebyshev.u.recurrences
### Title: Recurrence relations for Chebyshev polynomials
### Aliases: chebyshev.u.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrence relations for 
### the normalized U Chebyshev polynomials
### of orders 0 to 10
###
normalized.r <- chebyshev.u.recurrences( 10, normalized=TRUE )
print( normalized.r )
###
### generate the recurrence relations for 
### the unnormalized U Chebyshev polynomials
### of orders 0 to 10
###
unnormalized.r <- chebyshev.u.recurrences( 10, normalized=FALSE )
print( unnormalized.r )



