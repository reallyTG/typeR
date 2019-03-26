library(orthopolynom)


### Name: chebyshev.t.weight
### Title: Weight function for the Chebyshev polynomial
### Aliases: chebyshev.t.weight
### Keywords: math

### ** Examples

###
### compute the T Chebyshev function for argument values between -2 and 2
x <- seq( -1, 1, .01 )
y <- chebyshev.t.weight( x )
plot( x, y )



