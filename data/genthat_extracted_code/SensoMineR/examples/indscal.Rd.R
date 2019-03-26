library(SensoMineR)


### Name: indscal
### Title: Construct the Indscal model for Napping data type
### Aliases: indscal
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(napping)
##D nappeplot(napping.don)
##D resindscal<- indscal(napping.don, napping.words)
##D dev.new()
##D prefpls(cbind(resindscal$points, napping.words))
##D dev.new()
##D pmfa(napping.don, napping.words, mean.conf = resindscal$points)
## End(Not run)



