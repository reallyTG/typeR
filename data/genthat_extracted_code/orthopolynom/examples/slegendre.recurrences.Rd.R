library(orthopolynom)


### Name: slegendre.recurrences
### Title: Recurrence relations for shifted Legendre polynomials
### Aliases: slegendre.recurrences
### Keywords: math

### ** Examples

###
### generate the recurrence relations for normalized shifted Legendre polynomials
### of orders 0 to 10
###
normalized.r <- slegendre.recurrences( 10, normalized=TRUE )
print( normalized.r )
###
### generate the recurrence relations for normalized shifted Legendre polynomials
### of orders 0 to 10
###
unnormalized.r <- slegendre.recurrences( 10, normalized=FALSE )
print( unnormalized.r )



