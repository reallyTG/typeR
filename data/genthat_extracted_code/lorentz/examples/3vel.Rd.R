library(lorentz)


### Name: 3vel
### Title: Three velocities
### Aliases: 3vel as.3vel is.3vel length.vel length.vel names.vel
###   names<-.vel threevel 3velocity 3-velocity threevelocity
###   three-velocity

### ** Examples


x <- as.3vel(1:3/4)
u <- as.3vel(matrix(runif(30)/10,ncol=3))

names(u) <- letters[1:10]

x+u
u+x  # not equal






