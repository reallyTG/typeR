library(SIN)


### Name: plotCGpvalues
### Title: Plot simultaneous p-values for chain graphs
### Aliases: plotCGpvalues
### Keywords: multivariate

### ** Examples

data(fowlbones)
blocks <- list(1:2,3:4,5:6)
pvals <- holm(sinCG(blocks,fowlbones$corr,fowlbones$n, type="AMP"))
## Not run: plotCGpvalues(blocks, pvals)
## Not run: plotCGpvalues(blocks, pvals, legend=FALSE)
## Not run: plotCGpvalues(blocks, pvals, legendpos=c(7,0.5))
## Not run: plotCGpvalues(blocks, pvals, legend=TRUE, legendpos=c(7,0.5))



