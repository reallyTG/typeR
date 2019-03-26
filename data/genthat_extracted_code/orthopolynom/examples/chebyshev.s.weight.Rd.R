library(orthopolynom)


### Name: chebyshev.s.weight
### Title: Weight function for the Chebyshev polynomial
### Aliases: chebyshev.s.weight
### Keywords: math

### ** Examples

###
### compute the S Chebyshev weight function for arguments between -2 and 2
###
x <- seq( -2, 2, .01 )
y <- chebyshev.s.weight( x )
plot( x, y )



