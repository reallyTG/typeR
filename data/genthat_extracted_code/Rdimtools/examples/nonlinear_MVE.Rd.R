library(Rdimtools)


### Name: do.mve
### Title: Minimum Volume Embedding
### Aliases: do.mve

### ** Examples

## Not run: 
##D ## generate ribbon-shaped data
##D ## in order to pass CRAN pretest, n is set to be small.
##D X = aux.gensamples(dname="ribbon",n=50)
##D 
##D ## Compare MVU and MVE
##D #  Note that MVE actually requires much larger number of iterations
##D #  Here, due to CRAN limit, it was set as 7.
##D outMVU5  <- do.mvu(X, ndim=2, type=c("knn",5), projtype="kpca")
##D outMVE5  <- do.mve(X, ndim=2, knn=5, maxiter=7)
##D 
##D ## Visualize two comparisons
##D par(mfrow=c(1,2))
##D plot(outMVU5$Y[,1], outMVU5$Y[,2],  main="MVU (k=5)")
##D plot(outMVE5$Y[,1], outMVE5$Y[,2],  main="MVE (k=5)")
## End(Not run)




