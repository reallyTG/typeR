library(cubing)


### Name: cubieCube
### Title: Create and Convert CubieCubes
### Aliases: getCubieCube cubieCube as.cubieCube is.cubieCube
### Keywords: manip

### ** Examples

aCube <- getCubieCube("Wire")
bCube <- cubieCube("UUUUUUUUU RLLRRRLLR BBFFFFFBB DDDDDDDDD LRRLLLRRL FFBBBBBFF")
cCube <- cubieCube("FBBBUFRRB DUUFRUFFB DBRBFDUFL FRDDDLDDL UUFULLLLL RDRRBLURB")
identical(aCube, bCube)
is.cubieCube(aCube)

## Not run: plot(aCube)
## Not run: plot3D(aCube)
## Not run: plot(cCube)
## Not run: plot3D(cCube)

## Not run: plot(getCubieCube(), numbers = TRUE)
## Not run: plot(getCubieCube(), numbers = TRUE, blank = TRUE)



