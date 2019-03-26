library(bio3d)


### Name: rmsip
### Title: Root Mean Square Inner Product
### Aliases: rmsip rmsip.default rmsip.enma
### Keywords: utilities

### ** Examples

## Not run: 
##D # Load data for HIV example
##D trj <- read.dcd(system.file("examples/hivp.dcd", package="bio3d"))
##D pdb <- read.pdb(system.file("examples/hivp.pdb", package="bio3d"))
##D 
##D # Do PCA on simulation data
##D xyz.md <- fit.xyz(pdb$xyz, trj, fixed.inds=1:ncol(trj))
##D pc.sim <- pca.xyz(xyz.md)
##D 
##D # NMA 
##D modes <- nma(pdb)
##D 
##D # Calculate the RMSIP between the MD-PCs and the NMA-MODEs
##D r <- rmsip(modes, pc.sim, subset=10, row.name="NMA", col.name="PCA")
##D 
##D # Plot pairwise overlap values
##D plot(r, xlab="NMA", ylab="PCA")
## End(Not run)



