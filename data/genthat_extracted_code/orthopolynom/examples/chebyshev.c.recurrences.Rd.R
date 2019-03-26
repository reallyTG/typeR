library(orthopolynom)


### Name: chebyshev.c.recurrences
### Title: Recurrence relations for Chebyshev polynomials
### Aliases: chebyshev.c.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrences data frame for 
### the normalized Chebyshev C polynomials
### of orders 0 to 10.
###
normalized.r <- chebyshev.c.recurrences( 10, normalized=TRUE )
print( normalized.r )
###
### generate the recurrences data frame for 
### the normalized Chebyshev C polynomials
### of orders 0 to 10.
###
unnormalized.r <- chebyshev.c.recurrences( 10, normalized=FALSE )
print( unnormalized.r )



