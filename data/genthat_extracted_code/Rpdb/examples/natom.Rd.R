library(Rpdb)


### Name: natom
### Title: Number of Atoms in an Object Containing Atomic Coordinates
### Aliases: natom natom.atoms natom.coords natom.pdb
### Keywords: manip

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
natom(x)
natom(x, x$atoms$resid)
natom(x, x$atoms$resname)
natom(x, HETATM=FALSE)
  



