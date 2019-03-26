library(icosa)


### Name: chullsphere
### Title: Spherical convex hull
### Aliases: chullsphere

### ** Examples

# generate some random points
allData <- rpsphere(1000)
# select only a subset
points<-allData[allData[,1]>3000,]
chullsphere(points)





