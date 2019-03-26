library(SIN)


### Name: plotUGpvalues
### Title: Plot simultaneous p-values for undirected graphs
### Aliases: plotUGpvalues
### Keywords: multivariate

### ** Examples

data(fowlbones)
pvals <- holm(sinUG(fowlbones$corr,fowlbones$n))
## Not run: plotUGpvalues(pvals)
## Not run: plotUGpvalues(pvals, legend=FALSE)
## Not run: plotUGpvalues(pvals, legendpos=c(7,0.5))
## Not run: plotUGpvalues(pvals, legend=TRUE, legendpos=c(7,0.5))



