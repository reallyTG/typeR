library(orthopolynom)


### Name: chebyshev.u.weight
### Title: Weight function for the Chebyshev polynomial
### Aliases: chebyshev.u.weight
### Keywords: math

### ** Examples

###
### compute the U Chebyshev function for argument values between -2 and 2
###
x <- seq( -1, 1, .01 )
y <- chebyshev.u.weight( x )
plot( x, y )



