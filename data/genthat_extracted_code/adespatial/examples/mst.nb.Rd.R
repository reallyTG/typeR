library(adespatial)


### Name: mst.nb
### Title: Function to compute neighborhood based on the minimum spanning
###   tree
### Aliases: mst.nb
### Keywords: spatial

### ** Examples


xy <- matrix(rnorm(60),30,2)
dxy <- dist(xy)
th <- give.thresh(dxy)
nb1 <- mst.nb(dxy)
nb1
wh1 <- which(as.matrix(dxy)==th,arr.ind=TRUE)
plot(nb1,xy,pch=20,cex=2,lty=3)
lines(xy[wh1[1,],1],xy[wh1[1,],2],lwd=2)
title(main="Maximum distance of the minimum spanning tree in bold")




