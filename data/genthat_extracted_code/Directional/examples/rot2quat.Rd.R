library(Directional)


### Name: Converting a rotation matrix on SO(3) to an unsigned unit quaternion
### Title: Converting a rotation matrix on SO(3) to an unsigned unit
###   quaternion
### Aliases: rot2quat

### ** Examples

x <- rnorm(4)
x <- x/sqrt( sum(x^2) ) ## an unit quaternion in R4 ##
R <- quat2rot(x)
R
x
rot2quat(R) ## sign is not exact as you can see



