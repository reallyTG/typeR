library(orthopolynom)


### Name: schebyshev.t.recurrences
### Title: Recurrence relations for shifted Chebyshev polynomials
### Aliases: schebyshev.t.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrence relations for 
### the normalized shifted T Chebyshev polynomials
### of orders 0 to 10
###
normalized.r <- schebyshev.t.recurrences( 10, normalized=TRUE )
print( normalized.r )
###
### generate the recurrence relations for 
### the unnormalized shifted T Chebyshev polynomials
### of orders 0 to 10
###
unnormalized.r <- schebyshev.t.recurrences( 10, normalized=FALSE )
print( unnormalized.r )



