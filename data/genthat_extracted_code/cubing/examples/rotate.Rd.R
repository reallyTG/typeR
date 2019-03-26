library(cubing)


### Name: rotate
### Title: Perform Rotations, Wide Moves and Middle Slice Moves
### Aliases: rotate slice wide
### Keywords: manip

### ** Examples

aCube <- getCubieCube("HenrysSnake")
bCube <- slice(rotate(aCube, "z'"), "M2") 
cCube <- move(aCube, "z'M2")
identical(bCube, cCube)

## Not run: plot(cCube)
## Not run: plot3D(cCube)



