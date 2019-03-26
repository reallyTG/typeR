library(icosa)


### Name: surfacecentroid
### Title: Surface centroid point of a spherical point cloud
### Aliases: surfacecentroid

### ** Examples

# generate some random points
allData <- rpsphere(1000)
# select only a subset
points<-allData[allData[,1]>3000,]
# the spherical centroid
sc <- surfacecentroid(points)
sc

#3d plot
plot3d(points)
points3d(sc[1], sc[2], sc[3], col="red", size=5)




