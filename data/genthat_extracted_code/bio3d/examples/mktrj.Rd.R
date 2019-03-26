library(bio3d)


### Name: mktrj
### Title: PCA / NMA Atomic Displacement Trajectory
### Aliases: mktrj mktrj.pca mktrj.nma mktrj.enma
### Keywords: utilities

### ** Examples

## Not run: 
##D 
##D ##- PCA example
##D attach(transducin)
##D 
##D # Calculate principal components
##D pc.xray <- pca(pdbs, fit=TRUE)
##D 
##D # Write PC trajectory of pc=1
##D outfile = tempfile()
##D a <- mktrj(pc.xray, file = outfile)
##D outfile
##D 
##D detach(transducin)
##D 
##D 
##D ##- NMA example
##D ## Fetch stucture
##D pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )
##D 
##D ## Calculate (vibrational) normal modes
##D modes <- nma(pdb)
##D 
##D ## Visualize modes
##D outfile = file.path(tempdir(), "mode_7.pdb")
##D mktrj(modes, mode=7, pdb=pdb, file = outfile)
##D outfile
##D 
## End(Not run)



