library(orthopolynom)


### Name: chebyshev.s.recurrences
### Title: Recurrence relations for Chebyshev polynomials
### Aliases: chebyshev.s.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrences data frame for 
### the normalized Chebyshev S polynomials
### of orders 0 to 10.
###
normalized.r <- chebyshev.s.recurrences( 10, normalized=TRUE )
print( normalized.r )
###
### generate the recurrences data frame for 
### the normalized Chebyshev S polynomials
### of orders 0 to 10.
###
unnormalized.r <- chebyshev.s.recurrences( 10, normalized=FALSE )
print( unnormalized.r )



