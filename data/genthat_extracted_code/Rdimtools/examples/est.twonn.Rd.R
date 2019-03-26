library(Rdimtools)


### Name: est.twonn
### Title: Intrinsic Dimension Estimation by a Minimal Neighborhood
###   Information
### Aliases: est.twonn

### ** Examples

## Not run: 
##D ## create 3 datasets of intrinsic dimension 2.
##D X1 = aux.gensamples(dname="swiss")
##D X2 = aux.gensamples(dname="ribbon")
##D X3 = aux.gensamples(dname="saddle")
##D 
##D ## acquire an estimate for intrinsic dimension
##D out1 = est.twonn(X1)
##D out2 = est.twonn(X2)
##D out3 = est.twonn(X3)
##D 
##D ## print the results
##D sprintf("* est.twonn : estimated dimension for 'swiss'  data is %.2f.",out1$estdim)
##D sprintf("* est.twonn : estimated dimension for 'ribbon' data is %.2f.",out2$estdim)
##D sprintf("* est.twonn : estimated dimension for 'saddle' data is %.2f.",out3$estdim)
## End(Not run)




