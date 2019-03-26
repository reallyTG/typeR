library(NMF)


### Name: heatmap-NMF
### Title: Heatmaps of NMF Factors
### Aliases: basismap basismap-methods basismap,NMFfitX-method
###   basismap,NMF-method coefmap coefmap-methods coefmap,NMFfitX-method
###   coefmap,NMF-method consensusmap consensusmap,matrix-method
###   consensusmap-methods consensusmap,NMFfitX-method
###   consensusmap,NMF-method heatmap-NMF
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

#----------
# heatmap-NMF
#----------
## More examples are provided in demo `heatmaps`
## Not run: 
##D demo(heatmaps)
## End(Not run)
##

# random data with underlying NMF model
v <- syntheticNMF(20, 3, 10)
# estimate a model
x <- nmf(v, 3)

#----------
# basismap
#----------
# show basis matrix
basismap(x)
## Not run: 
##D # without the default annotation tracks
##D basismap(x, tracks=NA)
## End(Not run)

#----------
# coefmap
#----------
# coefficient matrix
coefmap(x)
## Not run: 
##D # without the default annotation tracks
##D coefmap(x, tracks=NA)
## End(Not run)

#----------
# consensusmap
#----------
## Not run: 
##D res <- nmf(x, 3, nrun=3)
##D consensusmap(res)
## End(Not run)



