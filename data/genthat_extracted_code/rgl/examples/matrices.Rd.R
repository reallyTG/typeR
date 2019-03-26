library(rgl)


### Name: matrices
### Title: Work with homogeneous coordinates
### Aliases: matrices identityMatrix scaleMatrix translationMatrix
###   rotationMatrix scale3d translate3d rotate3d transform3d asHomogeneous
###   asEuclidean
### Keywords: dynamic

### ** Examples

# A 90 degree rotation about the x axis:

rotationMatrix(pi/2, 1, 0, 0)

# Find what happens when you rotate (2, 0, 0) by 45 degrees about the y axis:

x <- asHomogeneous(c(2, 0, 0))
y <- x 
asEuclidean(y)

# or more simply...

rotate3d(c(2, 0, 0), pi/4, 0, 1, 0)




