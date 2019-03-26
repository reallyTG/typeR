library(Rdimtools)


### Name: est.mle2
### Title: Maximum Likelihood Esimation with Poisson Process and Bias
###   Correction
### Aliases: est.mle2

### ** Examples

## Not run: 
##D ## create example data sets with intrinsic dimension 2
##D X1 = aux.gensamples(dname="swiss")
##D X2 = aux.gensamples(dname="ribbon")
##D X3 = aux.gensamples(dname="saddle")
##D 
##D ## acquire an estimate for intrinsic dimension
##D out1 = est.mle2(X1)
##D out2 = est.mle2(X2)
##D out3 = est.mle2(X3)
##D 
##D sprintf("* est.mle2 : estimated dimension for 'swiss'  data is %.2f.",out1$estdim)
##D sprintf("* est.mle2 : estimated dimension for 'ribbon' data is %.2f.",out2$estdim)
##D sprintf("* est.mle2 : estimated dimension for 'saddle' data is %.2f.",out3$estdim)
## End(Not run)



