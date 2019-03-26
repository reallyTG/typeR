library(Rdimtools)


### Name: est.nearneighbor1
### Title: Intrinsic Dimension Estimation with Near-Neighbor Information
### Aliases: est.nearneighbor1

### ** Examples

## Not run: 
##D ## create an example data with intrinsic dimension 2
##D X = cbind(aux.gensamples(dname="swiss"),aux.gensamples(dname="swiss"))
##D 
##D ## acquire an estimate for intrinsic dimension
##D output = est.nearneighbor1(X)
##D sprintf("* est.nearneighbor1 : estimated dimension is %.2f.",output$estdim)
## End(Not run)




