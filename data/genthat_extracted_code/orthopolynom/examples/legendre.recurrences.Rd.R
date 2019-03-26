library(orthopolynom)


### Name: legendre.recurrences
### Title: Recurrence relations for Legendre polynomials
### Aliases: legendre.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrences data frame for 
### the normalized Legendre polynomials
### of orders 0 to 10.
###
normalized.r <- legendre.recurrences( 10, normalized=TRUE )
print( normalized.r )
###
### generate the recurrences data frame for 
### the normalized Legendre polynomials
### of orders 0 to 10.
###
unnormalized.r <- legendre.recurrences( 10, normalized=FALSE )
print( unnormalized.r )



