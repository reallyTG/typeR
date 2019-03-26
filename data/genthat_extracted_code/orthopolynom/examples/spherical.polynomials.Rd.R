library(orthopolynom)


### Name: spherical.polynomials
### Title: Create list of spherical polynomials
### Aliases: spherical.polynomials
### Keywords: math

### ** Examples

###
### generate a list of spherical orthonormal polynomials of orders 0 to 10
###
normalized.p.list <- spherical.polynomials( 10, normalized=TRUE )
print( normalized.p.list )
###
### generate a list of spherical orthogonal polynomials of orders 0 to 10
###
unnormalized.p.list <- spherical.polynomials( 10, normalized=FALSE )
print( unnormalized.p.list )



