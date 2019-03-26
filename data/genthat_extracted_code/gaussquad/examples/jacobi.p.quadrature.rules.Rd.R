library(gaussquad)


### Name: jacobi.p.quadrature.rules
### Title: Create list of Jacobi quadrature rules
### Aliases: jacobi.p.quadrature.rules
### Keywords: math

### ** Examples

###
### construct the list of quadrature rules for
### the Jacobi orthogonal polynomials
### of orders 1 to 5
### alpha = 3 and beta = 2
###
orthogonal.rules <- jacobi.p.quadrature.rules( 5, 3, 2 )
print( orthogonal.rules )
###
### construct the list of quadrature rules for
### the Jacobi orthonormal polynomials
### of orders 1 to 5
### alpha = 3 and beta = 2
###
orthonormal.rules <- jacobi.p.quadrature.rules( 5, 3, 2, TRUE )
print( orthonormal.rules )



