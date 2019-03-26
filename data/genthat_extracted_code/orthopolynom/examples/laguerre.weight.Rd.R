library(orthopolynom)


### Name: laguerre.weight
### Title: Weight function for the Laguerre polynomial
### Aliases: laguerre.weight
### Keywords: math

### ** Examples

###
### compute the Laguerre weight function for argument values
### between 0 and 3
x <- seq( -0, 3, .01 )
y <- laguerre.weight( x )
plot( x, y )



