library(compositions)


### Name: logratioVariogram
### Title: Empirical variograms for compositions
### Aliases: logratioVariogram
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(juraset)
##D X <- with(juraset,cbind(X,Y))
##D comp <- acomp(juraset,c("Cd","Cu","Pb","Co","Cr"))
##D lrv <- logratioVariogram(comp,X,maxdist=1,nbins=10)
##D plot(lrv)
## End(Not run)



