library(DCluster)


### Name: opgam
### Title: Openshaw's GAM
### Aliases: opgam opgam.intern
### Keywords: spatial

### ** Examples

library(spdep)

data(nc.sids)

sids<-data.frame(Observed=nc.sids$SID74)
sids<-cbind(sids, Expected=nc.sids$BIR74*sum(nc.sids$SID74)/sum(nc.sids$BIR74))
sids<-cbind(sids, x=nc.sids$x, y=nc.sids$y)


#GAM using the centroids of the areas in data
sidsgam<-opgam(data=sids,  radius=30, step=10, alpha=.002)

#Plot centroids
plot(sids$x, sids$y, xlab="Easting", ylab="Northing")
#Plot points marked as clusters
points(sidsgam$x, sidsgam$y, col="red", pch="*")




