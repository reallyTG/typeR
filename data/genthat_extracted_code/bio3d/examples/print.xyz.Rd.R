library(bio3d)


### Name: print.xyz
### Title: Printing XYZ coordinates
### Aliases: print.xyz
### Keywords: utilities

### ** Examples


# Read a PDB file
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )
print(pdb$xyz)




