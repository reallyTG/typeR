library(orthopolynom)


### Name: schebyshev.t.weight
### Title: Weight function for the shifted Chebyshev polynomial
### Aliases: schebyshev.t.weight
### Keywords: math

### ** Examples

###
### compute the shifted T Chebyshev weight function for argument values
### between 0 and 1
x <- seq( 0, 1, .01 )
y <- schebyshev.t.weight( x )
plot( x, y )



