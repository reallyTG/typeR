library(orthopolynom)


### Name: polynomial.powers
### Title: Create a list of polynomial linear combinations
### Aliases: polynomial.powers
### Keywords: math

### ** Examples

###
### generate Legendre polynomials of orders 0 to 10
###
polynomials <- legendre.polynomials( 10 )
###
### generate list of linear combinations of these polynomials
###
alphas <- polynomial.powers( polynomials )
print( alphas )



