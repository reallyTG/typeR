library(bio3d)


### Name: angle.xyz
### Title: Calculate the Angle Between Three Atoms
### Aliases: angle.xyz
### Keywords: utilities

### ** Examples

## Read a PDB file
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )

## Angle between N-CA-C atoms of residue four
inds <- atom.select(pdb, resno=4, elety=c("N","CA","C"))
angle.xyz(pdb$xyz[inds$xyz])

## Basic stats of all N-CA-C bound angles
inds <- atom.select(pdb, elety=c("N","CA","C"))
summary( angle.xyz(pdb$xyz[inds$xyz]) )
#hist( angle.xyz(pdb$xyz[inds$xyz]), xlab="Angle" )




