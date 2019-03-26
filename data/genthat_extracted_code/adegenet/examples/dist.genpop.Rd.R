library(adegenet)


### Name: dist.genpop
### Title: Genetic distances between populations
### Aliases: dist.genpop
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(microsatt)
##D obj <- as.genpop(microsatt$tab)
##D 
##D listDist <- lapply(1:5, function(i) cailliez(dist.genpop(obj,met=i)))
##D for(i in 1:5) {attr(listDist[[i]],"Labels") <- popNames(obj)}
##D listPco <- lapply(listDist, dudi.pco,scannf=FALSE)
##D 
##D par(mfrow=c(2,3))
##D for(i in 1:5) {scatter(listPco[[i]],sub=paste("Dist:", i))}
##D 
## End(Not run)



