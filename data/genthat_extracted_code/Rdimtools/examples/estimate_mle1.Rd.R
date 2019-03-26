library(Rdimtools)


### Name: est.mle1
### Title: Maximum Likelihood Esimation with Poisson Process
### Aliases: est.mle1

### ** Examples

## Not run: 
##D ## create example data sets with intrinsic dimension 2
##D X1 = aux.gensamples(dname="swiss")
##D X2 = aux.gensamples(dname="ribbon")
##D X3 = aux.gensamples(dname="saddle")
##D 
##D ## acquire an estimate for intrinsic dimension
##D out1 = est.mle1(X1)
##D out2 = est.mle1(X2)
##D out3 = est.mle1(X3)
##D 
##D sprintf("* est.mle1 : estimated dimension for 'swiss'  data is %.2f.",out1$estdim)
##D sprintf("* est.mle1 : estimated dimension for 'ribbon' data is %.2f.",out2$estdim)
##D sprintf("* est.mle1 : estimated dimension for 'saddle' data is %.2f.",out3$estdim)
## End(Not run)




