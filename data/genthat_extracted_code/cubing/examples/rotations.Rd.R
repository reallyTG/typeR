library(cubing)


### Name: rotations
### Title: Create and Plot All Rotations of a Cube
### Aliases: rotations plot.rotCubes
### Keywords: manip hplot

### ** Examples

rCubes <- rotations(randCube())
all.equal(rCubes[[5]], rCubes[[10]])
rCubes[[5]] == rCubes[[10]]
## Not run: plot(rCubes)



