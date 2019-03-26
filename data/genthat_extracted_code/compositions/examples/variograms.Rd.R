library(compositions)


### Name: variograms
### Title: Variogram functions
### Aliases: vgram.sph vgram.exp vgram.gauss vgram.cardsin vgram.lin
###   vgram.pow vgram.nugget
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(juraset)
##D X <- with(juraset,cbind(X,Y))
##D comp <- acomp(juraset,c("Cd","Cu","Pb","Co","Cr"))
##D lrv <- logratioVariogram(comp,X,maxdist=1,nbins=10)
##D plot(lrv)
## End(Not run)



