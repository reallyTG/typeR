library(Rpdb)


### Name: addAxes
### Title: Add Axes or PBC Box to the 'rgl' Scene
### Aliases: addABC addAxes addPBCBox addXYZ
### Keywords: dynamic

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
visualize(x, type = "l", xyz = FALSE, abc = FALSE, pbc.box = FALSE, mode = NULL)
addXYZ()
addABC(x$cryst1)
addPBCBox(x$cryst1)




