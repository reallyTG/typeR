library(orthopolynom)


### Name: gegenbauer.recurrences
### Title: Recurrence relations for Gegenbauer polynomials
### Aliases: gegenbauer.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrences data frame for 
### the normalized Gegenbauer polynomials
### of orders 0 to 10.
### polynomial parameter value is 1.0
###
normalized.r <- gegenbauer.recurrences( 10, 1, normalized=TRUE )
print( normalized.r )
###
### generate the recurrences data frame for 
### the normalized Gegenbauer polynomials
### of orders 0 to 10.
### polynomial parameter value is 1.0
###
unnormalized.r <- gegenbauer.recurrences( 10, 1, normalized=FALSE )
print( unnormalized.r )



