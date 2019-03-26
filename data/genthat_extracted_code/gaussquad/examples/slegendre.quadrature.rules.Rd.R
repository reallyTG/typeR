library(gaussquad)


### Name: slegendre.quadrature.rules
### Title: Create list of shifted Legendre quadrature rules
### Aliases: slegendre.quadrature.rules
### Keywords: math

### ** Examples

###
### generate the list of shifted Legendre quadrature rules
### for orders 1 to 5 for the orthogonal polynomials
###
orthogonal.rules <- slegendre.quadrature.rules( 5 )
print( orthogonal.rules )
###
### generate the list of shifted Legendre quadrature rules
### for orders 1 to 5 for the orthonormal polynomials
###
orthonormal.rules <- slegendre.quadrature.rules( 5, TRUE )
print( orthonormal.rules )



