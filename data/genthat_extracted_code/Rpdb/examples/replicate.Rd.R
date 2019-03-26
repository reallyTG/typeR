library(Rpdb)


### Name: replicate
### Title: Replicate Atomic Coordinates
### Aliases: replicate replicate.atoms replicate.coords replicate.pdb
### Keywords: manip

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))

#  Create a 3x3 supercell
y <- replicate(x, a.ind= 0:2, b.ind = 0:2, c.ind = 0:2)

#  Create a 3x3 supercell which might need to be wrapped (some molecules are ouside the cell)
y <- replicate(x, a.ind= -1:1, b.ind = -1:1, c.ind = -1:1)

#  Create a layered supercell with a vacuum layer in the bc-plan
y <- replicate(x, a.ind= c(0,2), b.ind = 0:2, c.ind = 0:2)




