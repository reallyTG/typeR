library(orthopolynom)


### Name: gegenbauer.weight
### Title: Weight function for the Gegenbauer polynomial
### Aliases: gegenbauer.weight
### Keywords: math

### ** Examples

###
### compute the Gegenbauer weight function for argument values between -1 and 1
###
x <- seq( -1, 1, .01 )
y <- gegenbauer.weight( x, 1 )
plot( x, y )



