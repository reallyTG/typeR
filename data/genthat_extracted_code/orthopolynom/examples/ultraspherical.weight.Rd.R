library(orthopolynom)


### Name: ultraspherical.weight
### Title: Weight function for the ultraspherical polynomial
### Aliases: ultraspherical.weight
### Keywords: math

### ** Examples

###
### compute the ultraspherical weight function for arguments between -2 and 2
### polynomial parameter is 1.0
###
x <- seq( -2, 2, .01 )
y <- ultraspherical.weight( x, 1 )
plot( x, y )



