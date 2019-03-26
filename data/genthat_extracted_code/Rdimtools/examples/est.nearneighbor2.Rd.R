library(Rdimtools)


### Name: est.nearneighbor2
### Title: Near-Neighbor Information with Bias Correction
### Aliases: est.nearneighbor2

### ** Examples

## Not run: 
##D ## create an example data with intrinsic dimension 2
##D X = cbind(aux.gensamples(dname="swiss"),aux.gensamples(dname="swiss"))
##D 
##D ## acquire an estimate for intrinsic dimension
##D output = est.nearneighbor2(X)
##D sprintf("* est.nearneighbor2 : estimated dimension is %.2f.",output$estdim)
## End(Not run)




