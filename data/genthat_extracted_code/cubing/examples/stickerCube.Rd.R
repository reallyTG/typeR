library(cubing)


### Name: stickerCube
### Title: Create and Convert StickerCubes
### Aliases: getStickerCube stickerCube as.stickerCube is.stickerCube
### Keywords: manip

### ** Examples

aCube <- getStickerCube("Wire")
bCube <- stickerCube("UUUUUUUUU RLLRRRLLR BBFFFFFBBD DDDDDDDDL RRLLLRRLF FBBBBBFF")
cCube <- stickerCube("FBBBUFRRB DUUFRUFFB DBRBFDUFLF RDDDLDDLU UFULLLLLR DRRBLURB")
identical(aCube, bCube)
is.stickerCube(aCube)

## Not run: plot(aCube)
## Not run: plot3D(aCube)
## Not run: plot(cCube)
## Not run: plot3D(cCube)

## Not run: plot(getStickerCube(), numbers = TRUE)
## Not run: plot(getStickerCube(), numbers = TRUE, blank = TRUE)



