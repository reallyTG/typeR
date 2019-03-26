library(Directional)


### Name: Rotation axis and angle of rotation given a rotation matrix
### Title: Rotation axis and angle of rotation given a rotation matrix
### Aliases: Arotation
### Keywords: Angle of rotation Axis of rotation

### ** Examples

ksi <- c(25.31, 24.29)
theta <- 2.38
A <- rot.matrix(ksi, theta, rads = FALSE)
A
Arotation(A)



