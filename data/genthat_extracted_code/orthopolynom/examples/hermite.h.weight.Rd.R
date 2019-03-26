library(orthopolynom)


### Name: hermite.h.weight
### Title: Weight function for the Hermite polynomial
### Aliases: hermite.h.weight
### Keywords: math

### ** Examples

###
### compute the Hermite weight function for argument values
### between -3 and 3
x <- seq( -3, 3, .01 )
y <- hermite.h.weight( x )
plot( x, y )



