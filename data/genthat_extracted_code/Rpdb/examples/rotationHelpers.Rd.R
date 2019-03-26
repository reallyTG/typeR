library(Rpdb)


### Name: rotationHelpers
### Title: Helper Functions for Rotation of Atomic Coordinates
### Aliases: Rx Rx.coords Rx.pdb Ry Ry.coords Ry.pdb Rz Rz.coords Rz.pdb
###   rotationHelpers
### Keywords: manip

### ** Examples

# First lets read a pdb file
x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
cell <- cell.coords(x)
visualize(x, mode = NULL)
# Rotation of the structure around the z-axis
visualize(Rz(x, 90), mode = NULL)
# Rotation of the residue 1 around the c-axis
visualize(Rz(x, 90, mask=x$atoms$resid==1), mode = NULL)




