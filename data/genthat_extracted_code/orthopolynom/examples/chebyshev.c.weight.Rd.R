library(orthopolynom)


### Name: chebyshev.c.weight
### Title: Weight function for the Chebyshev polynomial
### Aliases: chebyshev.c.weight
### Keywords: math

### ** Examples

###
### compute the C Chebyshev weight function for arguments between -3 and 3
###
x <- seq( -3, 3, .01 )
y <- chebyshev.c.weight( x )
plot( x, y )



