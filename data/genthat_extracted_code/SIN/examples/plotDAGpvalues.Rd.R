library(SIN)


### Name: plotDAGpvalues
### Title: Plot simultaneous p-values for acyclic directed graphs
### Aliases: plotDAGpvalues
### Keywords: multivariate

### ** Examples

data(fowlbones)
p <- dim(fowlbones$corr)[1]
pvals <- holm(sinDAG(list(1:p),fowlbones$corr,fowlbones$n))
## Not run: plotDAGpvalues(pvals)
## Not run: plotDAGpvalues(pvals, legend=FALSE)
## Not run: plotDAGpvalues(pvals, legendpos=c(7,0.5))
## Not run: plotDAGpvalues(pvals, legend=TRUE, legendpos=c(7,0.5))



