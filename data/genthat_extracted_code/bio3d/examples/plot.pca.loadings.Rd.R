library(bio3d)


### Name: plot.pca.loadings
### Title: Plot Residue Loadings along PC1 to PC3
### Aliases: plot.pca.loadings
### Keywords: hplot

### ** Examples

attach(transducin)

pc.xray <- pca.xyz(pdbs$xyz[, gap.inspect(pdbs$xyz)$f.inds])
plot.pca.loadings(pc.xray$U)

detach(transducin)



