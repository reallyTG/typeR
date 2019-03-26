library(bio3d)


### Name: dccm.xyz
### Title: DCCM: Dynamical Cross-Correlation Matrix
### Aliases: dccm.xyz cov2dccm
### Keywords: utilities

### ** Examples


## Not run: 
##D ##-- Read example trajectory file
##D trtfile <- system.file("examples/hivp.dcd", package="bio3d")
##D trj <- read.dcd(trtfile)
##D 
##D ## Read the starting PDB file to determine atom correspondence
##D pdbfile <- system.file("examples/hivp.pdb", package="bio3d")
##D pdb <- read.pdb(pdbfile)
##D 
##D ## select residues 24 to 27 and 85 to 90 in both chains
##D inds <- atom.select(pdb, resno=c(24:27,85:90), elety='CA')
##D 
##D ## lsq fit of trj on pdb
##D xyz <- fit.xyz(pdb$xyz, trj, fixed.inds=inds$xyz, mobile.inds=inds$xyz)
##D 
##D ## DCCM (slow to run so restrict to Calpha)
##D cij <- dccm(xyz)
##D 
##D ## Plot DCCM
##D plot(cij)
##D 
##D ## Or
##D library(lattice)
##D contourplot(cij, region = TRUE, labels=FALSE, col="gray40",
##D             at=c(-1, -0.75, -0.5, -0.25, 0.25, 0.5, 0.75, 1),
##D             xlab="Residue No.", ylab="Residue No.",
##D             main="DCCM: dynamic cross-correlation map")
## End(Not run)




