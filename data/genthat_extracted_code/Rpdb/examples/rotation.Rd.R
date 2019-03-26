library(Rpdb)


### Name: rotation
### Title: Rotation of Atomic Coordinates
### Aliases: R R.coords R.pdb rotation
### Keywords: manip

### ** Examples

# First lets read a pdb file
x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
cell <- cell.coords(x)
visualize(x, mode = NULL)
# Rotation of the structure around the c-axis
visualize(R(x, 90, x=cell["x","c"], y=cell["y","c"], z=cell["z","c"]),
          mode = NULL)
# Rotation of the residue 1 around the c-axis
visualize(R(x, 90, x=cell["x","c"], y=cell["y","c"], z=cell["z","c"], mask=x$atoms$resid==1),
          mode = NULL)
          



