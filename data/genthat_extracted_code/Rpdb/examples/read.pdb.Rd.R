library(Rpdb)


### Name: read.pdb
### Title: PDB File Reader
### Aliases: read.pdb
### Keywords: IO

### ** Examples

## Read a PDB file included with the package
x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))

## Visualize the PDB file
visualize(x, mode = NULL)

## Write the 'pdb' object 'x' in file "Rpdb.pdb" into the current directory
write.pdb(x, file = "Rpdb.pdb")




