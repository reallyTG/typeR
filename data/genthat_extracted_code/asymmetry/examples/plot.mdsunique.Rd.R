library(asymmetry)


### Name: plot.mdsunique
### Title: Configuration Plot for mdsunique
### Aliases: plot.mdsunique

### ** Examples

## Not run: 
##D data("studentmigration")
##D mm<-studentmigration
##D mm[mm==0]<-.5          # replace zeroes by a small number
##D mm <- -log(mm/sum(mm)) # convert similarities to dissimilarities
##D v<-mdsunique(mm,ndim = 2,itmax = 2100,verbose=TRUE, eps = .0000000001)
##D plot(v, yplus = .3)
## End(Not run)



