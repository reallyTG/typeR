library(bio3d)


### Name: trim.xyz
### Title: Trim a XYZ Object of Cartesian Coordinates.
### Aliases: trim.xyz
### Keywords: utilities

### ** Examples

## Not run: 
##D ## Read a PDB file from the RCSB online database
##D pdb <- read.pdb("1bg2")
##D 
##D ## Select calpha atoms
##D sele <- atom.select(pdb, "calpha")
##D 
##D ## Trim XYZ
##D trim(pdb$xyz, col.inds=sele$xyz)
##D 
##D ## Equals to
##D pdb$xyz[, sele$xyz, drop=FALSE]
## End(Not run)



