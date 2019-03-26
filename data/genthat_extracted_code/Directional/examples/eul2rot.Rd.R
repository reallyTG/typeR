library(Directional)


### Name: Rotation matrix on SO(3) from three Euler angles
### Title: Construct a rotation matrix on SO(3) from the Euler angles.
### Aliases: eul2rot

### ** Examples

# three euler angles

theta.12 <- sample( seq(-3, 3, 0.3), 1 )
theta.23 <- sample( seq(-3, 3, 0.3), 1 )
theta.13 <- sample( seq(-1.4, 1.4, 0.3), 1 )

theta.12 ; theta.23 ; theta.13

X <- eul2rot(theta.12, theta.23, theta.13)
X  # A rotation matrix
det(X)

e <- rot2eul(X)$v1

theta.12 <- e[3]
theta.23 <- e[2]
theta.13 <- e[1]

theta.12 ; theta.23 ; theta.13



