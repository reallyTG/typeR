library(Directional)


### Name: Rotation matrix to rotate a spherical vector along the direction of another
### Title: Rotation matrix to rotate a spherical vector along the direction
###   of another
### Aliases: rotation
### Keywords: Rotation matrix

### ** Examples

a <- rnorm(3)
a <- a/sqrt(sum(a^2))
b <- rnorm(3)
b <- b/sqrt(sum(b^2))
A <- rotation(a, b)
A
a  ;  b
a %*% t(A)

a <- rnorm(7)
a <- a/sqrt(sum(a^2))
b <- rnorm(7)
b <- b/sqrt(sum(b^2))
A <- rotation(a, b)
A
a  ;  b
a %*% t(A)



