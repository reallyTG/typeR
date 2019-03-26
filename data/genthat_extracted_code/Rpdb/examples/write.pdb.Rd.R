library(Rpdb)


### Name: write.pdb
### Title: PDB File Writer
### Aliases: write.pdb
### Keywords: IO

### ** Examples

## Read a PDB file included with the package
pdb <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))

## Write the pdb object in file "Rpdb.pdb" into the current directory
write.pdb(pdb, file = "Rpdb.pdb")




