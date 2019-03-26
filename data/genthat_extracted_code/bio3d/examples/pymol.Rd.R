library(bio3d)


### Name: pymol
### Title: Biomolecular Visualization with PyMOL
### Aliases: pymol pymol.pdbs pymol.nma pymol.pca pymol.modes pymol.dccm

### ** Examples

## Not run: 
##D 
##D ##- pymol with a 'pdbs' object
##D attach(transducin)
##D 
##D # build a pymol session containing all structures in the PDBs object
##D pymol(pdbs)
##D 
##D # color by invariant core (
##D # core <- core.find(pdbs)
##D pymol(pdbs, col=core)
##D 
##D # color by RMSF
##D pymol(pdbs, col="rmsf")
##D 
##D # color by clustering
##D rd <- rmsd(pdbs$xyz)
##D hc <- hclust(as.dist(rd))
##D grps <- cutree(hc, k=3)
##D pymol(pdbs, col=grps)
##D 
##D 
##D 
##D ##- pymol with a 'dccm' object
##D ## Fetch stucture
##D pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )
##D 
##D ## Calculate normal modes
##D modes <- nma(pdb)
##D 
##D ## Calculate correlation matrix
##D cm <- dccm.nma(modes)
##D 
##D pymol(cm, modes$xyz)
##D 
##D 
##D 
##D ##- pymol with a 'nma' or 'pca' object
##D pymol(modes, mode=7)
##D 
##D detach(transducin)
## End(Not run)



