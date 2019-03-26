library(Rdimtools)


### Name: est.Ustat
### Title: ID Estimation with Convergence Rate of U-statistic on Manifold
### Aliases: est.Ustat

### ** Examples

## Not run: 
##D ## create 3 datasets of intrinsic dimension 2.
##D X1 = aux.gensamples(dname="swiss")
##D X2 = aux.gensamples(dname="ribbon")
##D X3 = aux.gensamples(dname="saddle")
##D 
##D ## acquire an estimate for intrinsic dimension
##D out1 = est.Ustat(X1)
##D out2 = est.Ustat(X2)
##D out3 = est.Ustat(X3)
##D 
##D ## print the results
##D sprintf("* est.Ustat : estimated dimension for 'swiss'  data is %d.",out1$estdim)
##D sprintf("* est.Ustat : estimated dimension for 'ribbon' data is %d.",out2$estdim)
##D sprintf("* est.Ustat : estimated dimension for 'saddle' data is %d.",out3$estdim)
## End(Not run)




