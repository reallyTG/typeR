library(bio3d)


### Name: dccm.pca
### Title: Dynamic Cross-Correlation from Principal Component Analysis
### Aliases: dccm.pca
### Keywords: analysis

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
##D ## Select residues 24 to 27 and 85 to 90 in both chains
##D inds <- atom.select(pdb, resno=c(24:27,85:90), elety='CA')
##D 
##D ## lsq fit of trj on pdb
##D xyz <- fit.xyz(pdb$xyz, trj, fixed.inds=inds$xyz, mobile.inds=inds$xyz)
##D 
##D ## Do PCA
##D pca <- pca.xyz(xyz)
##D 
##D ## DCCM: only use first 10 PCs
##D cij <- dccm(pca, pc = c(1:10))
##D 
##D ## Plot DCCM
##D plot(cij)
##D 
##D ## DCCM: remove first 10 PCs
##D cij <- dccm(pca, pc = -c(1:10))
##D 
##D ## Plot DCCM
##D plot(cij)
## End(Not run)



