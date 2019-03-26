library(cubing)


### Name: solver
### Title: Rubik's Cube Solver
### Aliases: solver
### Keywords: manip

### ** Examples

aCube <- getCubieCube("EasyCheckerboard")
## Not run: plot(aCube)
## Not run: plot3D(aCube)
mvs <- solver(aCube, type = "KB")
is.solved(aCube %v% getMovesCube(mvs))



