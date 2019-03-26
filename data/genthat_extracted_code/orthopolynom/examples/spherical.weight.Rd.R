library(orthopolynom)


### Name: spherical.weight
### Title: Weight function for the spherical polynomial
### Aliases: spherical.weight
### Keywords: math

### ** Examples

###
### compute the spherical weight function for a sequence of values between -2 and 2
###
x <- seq( -2, 2, .01 )
y <- spherical.weight( x )
plot( x, y )



