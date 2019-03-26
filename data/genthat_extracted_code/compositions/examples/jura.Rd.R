library(compositions)


### Name: jura
### Title: The jura dataset
### Aliases: juraset jura259
### Keywords: datasets

### ** Examples

## Not run: 
##D data(juraset)
##D X <- with(juraset,cbind(X,Y))
##D comp <- acomp(juraset,c("Cd","Cu","Pb","Co","Cr"))
##D lrv <- logratioVariogram(comp,X,maxdist=1,nbins=10)
##D plot(lrv)
## End(Not run)




