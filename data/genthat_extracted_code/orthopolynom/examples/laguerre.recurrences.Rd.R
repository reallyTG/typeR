library(orthopolynom)


### Name: laguerre.recurrences
### Title: Recurrence relations for Laguerre polynomials
### Aliases: laguerre.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrences data frame for 
### the normalized Laguerre polynomials
### of orders 0 to 10.
###
normalized.r <- laguerre.recurrences( 10, normalized=TRUE )
print( normalized.r )
###
### generate the recurrences data frame for 
### the normalized Laguerre polynomials
### of orders 0 to 10.
###
unnormalized.r <- laguerre.recurrences( 10, normalized=FALSE )
print( unnormalized.r )



