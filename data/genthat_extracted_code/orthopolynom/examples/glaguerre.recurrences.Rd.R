library(orthopolynom)


### Name: glaguerre.recurrences
### Title: Recurrence relations for generalized Laguerre polynomials
### Aliases: glaguerre.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrences data frame for 
### the normalized generalized Laguerre polynomials
### of orders 0 to 10.  the polynomial parameter value is 1.0.
###
normalized.r <- glaguerre.recurrences( 10, 1, normalized=TRUE )
print( normalized.r )
###
### generate the recurrences data frame for 
### the unnormalized generalized Laguerre polynomials
### of orders 0 to 10.  the polynomial parameter value is 1.0.
###
unnormalized.r <- glaguerre.recurrences( 10, 1, normalized=FALSE )
print( unnormalized.r )



