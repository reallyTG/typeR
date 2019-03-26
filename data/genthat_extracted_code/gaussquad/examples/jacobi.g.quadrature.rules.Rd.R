library(gaussquad)


### Name: jacobi.g.quadrature.rules
### Title: Create list of Jacobi quadrature rules
### Aliases: jacobi.g.quadrature.rules
### Keywords: math

### ** Examples

###
### generate the list of quadrature rule data frames for
### the orthogonal Jacobi G polynomial
### of orders 1 to 5
### parameter p is 3 and parameter q is 2
###
orthogonal.rules <- jacobi.g.quadrature.rules( 5, 3, 2 )
print( orthogonal.rules )
###
### generate the list of quadrature rule data frames for
### the orthonormal Jacobi G polynomial
### of orders 1 to 5
### parameter p is 3 and parameter q is 2
###
orthonormal.rules <- jacobi.g.quadrature.rules( 5, 3, 2, TRUE )
print( orthonormal.rules )



