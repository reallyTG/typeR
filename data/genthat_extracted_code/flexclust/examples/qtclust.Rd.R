library(flexclust)


### Name: qtclust
### Title: Stochastic QT Clustering
### Aliases: qtclust
### Keywords: cluster

### ** Examples

x <- matrix(10*runif(1000), ncol=2)

## maximum distrance of point to cluster center is 3
cl1 <- qtclust(x, radius=3)

## maximum distrance of point to cluster center is 1
## -> more clusters, longer runtime
cl2 <- qtclust(x, radius=1)

opar <- par(c("mfrow","mar"))
par(mfrow=c(2,1), mar=c(2.1,2.1,1,1))
plot(x, col=predict(cl1), xlab="", ylab="")
plot(x, col=predict(cl2), xlab="", ylab="")
par(opar)



