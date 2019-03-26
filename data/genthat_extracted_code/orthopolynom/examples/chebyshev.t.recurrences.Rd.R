library(orthopolynom)


### Name: chebyshev.t.recurrences
### Title: Recurrence relations for Chebyshev polynomials
### Aliases: chebyshev.t.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrence relations for 
### the normalized T Chebyshev polynomials
### of orders 0 to 10
###
normalized.r <- chebyshev.t.recurrences( 10, normalized=TRUE )
print( normalized.r )
###
### generate the recurrence relations for 
### the normalized T Chebyshev polynomials
### of orders 0 to 10
###
unnormalized.r <- chebyshev.t.recurrences( 10, normalized=FALSE )
print( unnormalized.r )



