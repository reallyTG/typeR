library(Directional)


### Name: Rotation matrix from a rotation axis and angle of rotation
### Title: Rotation matrix from a rotation axis and angle of rotation
### Aliases: rot.matrix
### Keywords: Rotation matrix Axis of rotation Angle of rotation

### ** Examples

ksi <- c(25.31, 24.29)
theta <- 2.38
A <- rot.matrix(ksi, theta, rads = FALSE)
A
Arotation(A)



