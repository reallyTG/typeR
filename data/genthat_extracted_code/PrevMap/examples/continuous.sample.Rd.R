library(PrevMap)


### Name: continuous.sample
### Title: Spatially continuous sampling
### Aliases: continuous.sample

### ** Examples

library(geoR)
data(parana)
poly<-parana$borders
poly<-matrix(c(poly[,1],poly[,2]),dim(poly)[1],2,byrow=FALSE)
set.seed(5871121)

# Generate spatially regular sample
xy.sample<-continuous.sample(poly,100,30)
plot(poly,type="l",xlab="X",ylab="Y")
points(xy.sample,pch=19,cex=0.5)




