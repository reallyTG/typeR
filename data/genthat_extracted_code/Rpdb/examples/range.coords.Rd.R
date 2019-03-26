library(Rpdb)


### Name: range.coords
### Title: Range of Atomic Coordinates
### Aliases: range.atoms range.coords range.pdb
### Keywords: manip

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
range(x)
range(range(x))




