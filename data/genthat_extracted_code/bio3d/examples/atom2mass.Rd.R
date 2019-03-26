library(bio3d)


### Name: atom2mass
### Title: Atom Names/Types to Mass Converter
### Aliases: atom2mass atom2mass.default atom2mass.pdb
### Keywords: utilities

### ** Examples

atom.names <- c("CA", "O", "N", "OXT")
atom2mass(atom.names)

## No test: 
# PDB server connection required - testing excluded

## Get atomic symbols from a PDB object with a customized data set
pdb <- read.pdb("3RE0", verbose=FALSE)
inds <- atom.select(pdb, resno=201, verbose=FALSE)

## selected atoms
print(pdb$atom$elety[inds$atom])

## default will map CL2 to C
atom2mass(pdb, inds)

## map element CL2 correctly to Cl
myelety  <- data.frame(name = c("CL2","PT1","N1","N2"), symb = c("Cl","Pt","N","N"))
atom2mass(pdb, inds, elety.custom = myelety)

## custom masses
mymasses <- data.frame(symb = c("Cl","Pt"), mass = c(35.45, 195.08))
atom2mass(pdb, inds, elety.custom = myelety, mass.custom = mymasses)

## End(No test)



