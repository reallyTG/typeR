library(Rpdb)


### Name: mirror
### Title: Reflexion of Atomic Coordinates
### Aliases: mirror mirror.coords mirror.pdb
### Keywords: manip

### ** Examples

# First lets read a pdb file
x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
cell <- cell.coords(x)
visualize(x, mode = NULL)
# Mirror operation with respect to the ab-plan
visualize(mirror(x, rep(0,3), p1=cell[,"a"], p2=cell[,"b"]), mode = NULL)
# Mirror operation with respect to the ab-plan for residue 1
visualize(mirror(x, rep(0,3), p1=cell[,"a"], p2=cell[,"b"], mask=x$atoms$resid==1), mode = NULL)




