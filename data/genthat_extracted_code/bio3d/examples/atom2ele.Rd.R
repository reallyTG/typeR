library(bio3d)


### Name: atom2ele
### Title: Atom Names/Types to Atomic Symbols Converter
### Aliases: atom2ele atom2ele.default atom2ele.pdb
### Keywords: utilities

### ** Examples

atom.names <- c("CA", "O", "N", "OXT")
atom2ele(atom.names)

## No test: 
# PDB server connection required - testing excluded

## Get atomic symbols from a PDB object with a customized data set
pdb <- read.pdb("3RE0",verbose=FALSE)
lig <- trim(pdb, "ligand")

## maps PT1 to Pt, CL2 to Cl, C4A to C
atom2ele(lig)

## map atom name to element manually
myelety <- data.frame(name = "CL2", symb = "Cl")
atom2ele(lig, elety.custom = myelety)

## End(No test)



