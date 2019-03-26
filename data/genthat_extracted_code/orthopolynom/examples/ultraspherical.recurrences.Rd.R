library(orthopolynom)


### Name: ultraspherical.recurrences
### Title: Recurrence relations for ultraspherical polynomials
### Aliases: ultraspherical.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrence relations for 
### the normalized ultraspherical polynomials
### of orders 0 to 10
### polynomial parameter value is 1.0
###
normalized.r <- ultraspherical.recurrences( 10, 1, normalized=TRUE )
print( normalized.r )
###
### generate the recurrence relations for 
### the normalized ultraspherical polynomials
### of orders 0 to 10
### polynomial parameter value is 1.0
###
unnormalized.r <- ultraspherical.recurrences( 10, 1, normalized=FALSE )
print( unnormalized.r )



