library(bio3d)


### Name: plot.matrix.loadings
### Title: Plot Residue-Residue Matrix Loadings
### Aliases: plot.matrix.loadings

### ** Examples

## Not run: 
##D    attach(transducin)
##D    gaps.res <- gap.inspect(pdbs$ali)
##D    sse <- pdbs$sse[1, gaps.res$f.inds]
##D 
##D    # calculate modes
##D    modes <- nma(pdbs, ncore=NULL)
##D 
##D    # calculate cross-correlation matrices from the modes
##D    cijs <- dccm(modes, ncore=NULL)$all.dccm
##D 
##D    # do PCA on cross-correlation matrices
##D    pc <- pca.array(cijs)
##D 
##D    # plot loadings
##D    l <- plot.matrix.loadings(pc, sse=sse)
##D    l[1:10, 1:10]
##D 
##D    # plot loadings with elements 10-residue separated from diagonal masked
##D    plot.matrix.loadings(pc, sse=sse, mask.n=10)
##D 
## End(Not run)



