library(bio3d)


### Name: mask
### Title: Mask a Subset of Atoms in a DCCM Object.
### Aliases: mask mask.dccm
### Keywords: utilities

### ** Examples

## Calculate DCCM
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )
cij <- dccm(nma(pdb))

## Mask DCCM matrix according to matrix indices
cijm <- mask(cij, a.inds=40:50, b.inds=80:90)
plot(cijm)

## Retain only 40:50 to everything else
cijm <- mask(cij, a.inds=40:50)
plot(cijm)


## Mask DCCM matrix according PDB selection
pdb.ca <- trim(pdb, "calpha")
a.inds <- atom.select(pdb.ca, resno=40:50)
b.inds <- atom.select(pdb.ca, resno=80:90)

# Provide pdb object correspoding to input dccm
cijm <- mask(cij, pdb.ca, a.inds, b.inds)
plot(cijm)



