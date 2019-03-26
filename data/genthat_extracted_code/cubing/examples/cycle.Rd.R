library(cubing)


### Name: cycle
### Title: Cycle and Twist Cubies
### Aliases: cycleEdges cycleCorners flipEdges twistCorners
### Keywords: manip

### ** Examples

aCube <- getCubieCube("Superflip")
aCube <- flipEdges(aCube, flip = 1:12)
is.solved(aCube)
aCube <- twistCorners(aCube, clock = 3:6, anti = 2)
is.solvable(aCube)
aCube <- cycleEdges(aCube, c(2,10,5,6))
is.solvable(aCube)



