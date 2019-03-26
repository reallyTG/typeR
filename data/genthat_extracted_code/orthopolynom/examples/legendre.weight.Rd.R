library(orthopolynom)


### Name: legendre.weight
### Title: Weight function for the Legendre polynomial
### Aliases: legendre.weight
### Keywords: math

### ** Examples

###
### compute the Legendre weight function for argument values
### between -1 and 1
###
x <- seq( -1, 1, .01 )
y <- legendre.weight( x )
plot( x, y )



