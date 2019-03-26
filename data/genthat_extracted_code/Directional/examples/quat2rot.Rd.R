library(Directional)


### Name: Converting an unsigned unit quaternion to rotation matrix on SO(3)
### Title: Converting an unsigned unit quaternion to rotation matrix on
###   SO(3)
### Aliases: quat2rot

### ** Examples

x <- rnorm(4)
x <- x/sqrt( sum(x^2) )
x                   ## an unit quaternion in R4 ##
quat2rot(x)



