library(SIN)


### Name: plotBGpvalues
### Title: Plot simultaneous p-values for bidirected graphs
### Aliases: plotBGpvalues
### Keywords: multivariate

### ** Examples

data(stressful)
pvals <- holm(sinBG(stressful$corr,stressful$n))
## Not run: plotBGpvalues(pvals)
## Not run: plotBGpvalues(pvals, legend=FALSE)
## Not run: plotBGpvalues(pvals, legendpos=c(5,0.5))
## Not run: plotBGpvalues(pvals, legend=TRUE, legendpos=c(5,0.5))



