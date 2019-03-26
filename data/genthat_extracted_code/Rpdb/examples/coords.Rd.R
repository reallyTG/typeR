library(Rpdb)


### Name: coords
### Title: The Atomic Coordinates of an Object
### Aliases: coords coords.atoms coords.data.frame coords.default
###   coords.matrix coords.pdb coords<- coords<-.atoms coords<-.pdb
###   is.coords
### Keywords: classes manip

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
is.coords(x)
is.coords(x$atoms)

## Replace the coordinates of x by translated coordinates
coords(x) <- coords(Tz(x, 10))
coords(x)




