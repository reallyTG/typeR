library(bio3d)


### Name: com
### Title: Center of Mass
### Aliases: com com.pdb com.xyz
### Keywords: utilities

### ** Examples

## No test: 
# PDB server connection required - testing excluded

## Stucture of PKA:
pdb <- read.pdb("3dnd")

## Center of mass:
com(pdb)

## Center of mass of a selection
inds <- atom.select(pdb, chain="I")
com(pdb, inds)

## using XYZ Cartesian coordinates
xyz <- pdb$xyz[, inds$xyz]
com.xyz(xyz)

## with mass weighting
com.xyz(xyz, mass=atom2mass(pdb$atom[inds$atom, "elety"]) )

## End(No test)

## Not run: 
##D ## Unknown atom names
##D pdb <- read.pdb("3dnd")
##D inds <- atom.select(pdb, resid="LL2")
##D mycom <- com(pdb, inds, rescue=TRUE)
##D #warnings()
##D 
##D 
##D ## Map atom names manually
##D pdb <- read.pdb("3RE0")
##D inds <- atom.select(pdb, resno=201)
##D 
##D myelety  <- data.frame(name = c("CL2","PT1","N1","N2"), symb = c("Cl","Pt","N","N"))
##D mymasses <- data.frame(symb = c("Cl","Pt"), mass = c(35.45, 195.08))
##D mycom    <- com(pdb, inds, elety.custom=myelety, mass.custom=mymasses)
## End(Not run)



