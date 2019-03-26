library(bio3d)


### Name: pca.tor
### Title: Principal Component Analysis
### Aliases: pca.tor
### Keywords: utilities multivariate

### ** Examples

##-- PCA on torsion data for multiple PDBs 
attach(kinesin)

gaps.pos <- gap.inspect(pdbs$xyz)
tor <- t(apply( pdbs$xyz[, gaps.pos$f.inds], 1, torsion.xyz, atm.inc=1))
pc.tor <- pca.tor(tor[,-c(1,233,234,235)])
#plot(pc.tor)
plot.pca.loadings(pc.tor)

detach(kinesin)

## Not run: 
##D ##-- PCA on torsion data from an MD trajectory
##D trj <- read.dcd( system.file("examples/hivp.dcd", package="bio3d") )
##D tor <- t(apply(trj, 1, torsion.xyz, atm.inc=1))
##D gaps <- gap.inspect(tor)
##D pc.tor <- pca.tor(tor[,gaps$f.inds])
##D plot.pca.loadings(pc.tor)
## End(Not run)



