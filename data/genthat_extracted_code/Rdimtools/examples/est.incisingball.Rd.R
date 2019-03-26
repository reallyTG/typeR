library(Rdimtools)


### Name: est.incisingball
### Title: Intrinsic Dimension Estimation with Incising Ball
### Aliases: est.incisingball

### ** Examples

## Not run: 
##D ## create an example data with intrinsic dimension 2
##D X = cbind(aux.gensamples(dname="swiss"),aux.gensamples(dname="swiss"))
##D 
##D ## acquire an estimate for intrinsic dimension
##D output = est.incisingball(X)
##D sprintf("* est.incisingball : estimated dimension is %d.",output$estdim)
## End(Not run)




