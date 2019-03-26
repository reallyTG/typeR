library(PrevMap)


### Name: discrete.sample
### Title: Spatially discrete sampling
### Aliases: discrete.sample

### ** Examples

x<-0.015+0.03*(1:33)
xall<-rep(x,33)
yall<-c(t(matrix(xall,33,33)))
xy<-cbind(xall,yall)+matrix(-0.0075+0.015*runif(33*33*2),33*33,2)
par(pty="s",mfrow=c(1,2))
plot(xy[,1],xy[,2],pch=19,cex=0.25,xlab="Easting",ylab="Northing",
   cex.lab=1,cex.axis=1,cex.main=1)

set.seed(15892)
# Generate spatially random sample
xy.sample<-xy[sample(1:dim(xy)[1],50,replace=FALSE),]
points(xy.sample[,1],xy.sample[,2],pch=19,col="red")
points(xy[,1],xy[,2],pch=19,cex=0.25)
plot(xy[,1],xy[,2],pch=19,cex=0.25,xlab="Easting",ylab="Northing",
   cex.lab=1,cex.axis=1,cex.main=1)

set.seed(15892)
# Generate spatially regular sample
xy.sample<-discrete.sample(xy,50,0.08)
points(xy.sample[,1],xy.sample[,2],pch=19,col="red")
points(xy[,1],xy[,2],pch=19,cex=0.25)




