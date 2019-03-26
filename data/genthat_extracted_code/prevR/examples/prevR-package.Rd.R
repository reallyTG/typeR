library(prevR)


### Name: prevR-package
### Title: Estimating regional trends of a prevalence from a DHS.
### Aliases: prevR-package
### Keywords: package

### ** Examples

## Not run: 
##D par(ask = TRUE)
##D # Creating an object of class prevR
##D col <- c(id = "cluster", 
##D         x = "x",
##D         y = "y",
##D         n = "n",
##D         pos = "pos",
##D         c.type = "residence",
##D         wn = "weighted.n",
##D         wpos = "weighted.pos"
##D )
##D dhs <- as.prevR(fdhs.clusters,col, fdhs.boundary)
##D 
##D str(dhs)
##D print(dhs)
##D 
##D plot(dhs, main="Clusters position")
##D plot(dhs, type="c.type", main="Clusters by residence")
##D plot(dhs, type="count", main="Observations by cluster")
##D plot(dhs, type="flower", main="Positive cases by cluster")
##D 
##D # Changing coordinates projection
##D plot(dhs,axes=TRUE)
##D dhs <- changeproj(dhs,
##D                  "+proj=utm +zone=30 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")
##D print(dhs)
##D plot(dhs, axes=TRUE)
##D 
##D # Calculating rings of equal number of observations for different values of N
##D dhs <- rings(dhs,N=c(100,200,300,400,500))
##D print(dhs)
##D summary(dhs)
##D 
##D # Prevalence surface for N=300
##D prev.N300 <- kde(dhs, N=300, nb.cells=200)
##D spplot(prev.N300, 'k.wprev.N300.RInf',
##D       cuts=100, col.regions=prevR.colors.red(101),
##D       main="Regional trends of prevalence (N=300)"
##D )
##D 
##D # Smoothing ring radii surface (spatial interpolation by kriging)
##D radius.N300 <- krige('r.radius', dhs, N=300, nb.cells=200)
##D spplot(radius.N300, 
##D       cuts=100, col.regions=prevR.colors.blue(101),
##D       main="Radius of circle (N=300)"
##D )
##D par(ask = FALSE)
## End(Not run)



