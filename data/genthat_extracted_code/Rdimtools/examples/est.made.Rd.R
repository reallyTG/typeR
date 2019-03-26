library(Rdimtools)


### Name: est.made
### Title: Manifold-Adaptive Dimension Estimation
### Aliases: est.made

### ** Examples

## Not run: 
##D ## create a data set of intrinsic dimension 2.
##D X = aux.gensamples(dname="swiss")
##D 
##D ## compare effect of 3 combining scheme
##D out1 = est.made(X, combine="mean")
##D out2 = est.made(X, combine="median")
##D out3 = est.made(X, combine="vote")
##D 
##D ## print the results
##D sprintf("* est.made : estimated dimension with 'mean'   method is %d.",out1$estdim)
##D sprintf("* est.made : estimated dimension with 'median' method is %d.",out2$estdim)
##D sprintf("* est.made : estimated dimension with 'vote'   method is %d.",out3$estdim)
## End(Not run)




