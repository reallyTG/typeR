library(orthopolynom)


### Name: schebyshev.u.weight
### Title: Weight function for the shifted Chebyshev polynomial
### Aliases: schebyshev.u.weight
### Keywords: math

### ** Examples

###
### compute the shifted U Chebyshev weight function for argument values
### between 0 and 1
###
x <- seq( 0, 1, .01 )
y <- schebyshev.u.weight( x )
plot( x, y )



