library(fda.usc)


### Name: metric.hausdorff
### Title: Compute the Hausdorff distances between two curves.
### Aliases: metric.hausdorff
### Keywords: cluster

### ** Examples


## Not run: 
##D    
##D data(poblenou)
##D nox<-poblenou$nox[1:6]
##D # Hausdorff vs maximum distance
##D out1<-metric.hausdorff(nox)       
##D out2<-metric.lp(nox,lp=0) 
##D out1
##D out2
##D par(mfrow=c(1,3))
##D plot(nox)
##D plot(hclust(as.dist(out1)))
##D plot(hclust(as.dist(out2)))
## End(Not run)   



