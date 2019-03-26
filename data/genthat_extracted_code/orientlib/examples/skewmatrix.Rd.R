library(orientlib)


### Name: skewmatrix
### Title: Create an orientation using the entries in a skew-symmetric
###   matrix representation
### Aliases: skewmatrix skewmatrix,orientation-method
### Keywords: array algebra

### ** Examples

x <- skewmatrix(matrix(c(0,1,2,-1,0,3,-2,-3,0),3,3))
x
rotmatrix(x)
skewvector(x)
rotation.angle(x)



