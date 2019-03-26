library(Rdimtools)


### Name: est.packing
### Title: Intrinsic Dimension Estimation using Packing Numbers
### Aliases: est.packing

### ** Examples

## Not run: 
##D ## create 'swiss' roll dataset
##D X = aux.gensamples(dname="swiss")
##D 
##D ## try different eps values
##D out1 = est.packing(X, eps=0.1)
##D out2 = est.packing(X, eps=0.01)
##D out3 = est.packing(X, eps=0.001)
##D 
##D ## print the results
##D sprintf("* est.packing : estimated dimension with eps=0.1   is %.2f.",out1$estdim)
##D sprintf("* est.packing : estimated dimension with eps=0.01  is %.2f.",out2$estdim)
##D sprintf("* est.packing : estimated dimension with eps=0.001 is %.2f.",out3$estdim)
## End(Not run)




