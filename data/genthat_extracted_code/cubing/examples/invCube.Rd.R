library(cubing)


### Name: invCube
### Title: Calculate Inverse Cube
### Aliases: invCube
### Keywords: manip

### ** Examples

aCube <- getCubieCube("Tetris")
is.solved(aCube %v% invCube(aCube))
is.solved(invCube(aCube) %v% aCube)

## Not run: plot(aCube)
## Not run: plot(invCube(aCube))
## Not run: plot3D(aCube)
## Not run: plot3D(invCube(aCube))



