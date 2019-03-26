library(orthopolynom)


### Name: ultraspherical.polynomials
### Title: Create list of ultraspherical polynomials
### Aliases: ultraspherical.polynomials
### Keywords: math

### ** Examples

###
### gemerate a list of normalized ultra spherical polynomials 
### of orders 0 to 10
###
normalized.p.list <- ultraspherical.polynomials( 10, 1, normalized=TRUE )
print( normalized.p.list )
###
### gemerate a list of unnormalized ultra spherical polynomials 
### of orders 0 to 10
###
unnormalized.p.list <- ultraspherical.polynomials( 10, 1, normalized=FALSE )
print( unnormalized.p.list )



