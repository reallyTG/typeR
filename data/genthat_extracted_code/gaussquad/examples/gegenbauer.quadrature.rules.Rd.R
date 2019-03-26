library(gaussquad)


### Name: gegenbauer.quadrature.rules
### Title: Create list of Gegenbauer quadrature rules
### Aliases: gegenbauer.quadrature.rules
### Keywords: math

### ** Examples

###
### generate the list of quadrature rule data frames for
### the orthogonal Gegenbauer polynomials
### of orders 1 to 5
### polynomial parameter alpha is 1.0
###
orthogonal.rules <- gegenbauer.quadrature.rules( 5, 1 )
print( orthogonal.rules )
###
### generate the list of quadrature rule data frames for
### the orthonormal Gegenbauer polynomials
### of orders 1 to 5
### polynomial parameter alpha is 1.0
###
orthonormal.rules <- gegenbauer.quadrature.rules( 5, 1, TRUE )
print( orthonormal.rules )



