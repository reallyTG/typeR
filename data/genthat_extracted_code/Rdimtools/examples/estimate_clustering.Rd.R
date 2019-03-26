library(Rdimtools)


### Name: est.clustering
### Title: Intrinsic Dimension Estimation via Clustering
### Aliases: est.clustering

### ** Examples

## Not run: 
##D ## create 'swiss' roll dataset
##D X = aux.gensamples(dname="swiss")
##D 
##D ## try different k values
##D out1 = est.clustering(X, kmin=5)
##D out2 = est.clustering(X, kmin=25)
##D out3 = est.clustering(X, kmin=50)
##D 
##D ## print the results
##D sprintf("* est.clustering : estimated dimension with kmin=5  is %.2f.",out1$estdim)
##D sprintf("* est.clustering : estimated dimension with kmin=25 is %.2f.",out2$estdim)
##D sprintf("* est.clustering : estimated dimension with kmin=50 is %.2f.",out3$estdim)
## End(Not run)




