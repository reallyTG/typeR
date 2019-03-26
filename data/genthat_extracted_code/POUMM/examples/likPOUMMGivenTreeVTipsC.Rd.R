library(POUMM)


### Name: likPOUMMGivenTreeVTipsC
### Title: Fast (parallel) POUMM likelihood calculation using the SPLITT
###   library
### Aliases: likPOUMMGivenTreeVTipsC

### ** Examples

## Not run: 
##D N <- 100
##D tr <- ape::rtree(N)
##D z <- rVNodesGivenTreePOUMM(tr, 0, 2, 3, 1, 1)[1:N]
##D pruneInfo <- pruneTree(tr, z)
##D microbenchmark::microbenchmark(
##D   likCpp <- likPOUMMGivenTreeVTipsC(pruneInfo$integrator, 2, 3, 1, 1),
##D   likR <- likPOUMMGivenTreeVTips(z, tr, 2, 3, 1, 1, pruneInfo = pruneInfo))
##D 
##D # should be the same values
##D likCpp
##D likR
## End(Not run)




