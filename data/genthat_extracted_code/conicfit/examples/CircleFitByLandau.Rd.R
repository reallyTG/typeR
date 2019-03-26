library(conicfit)


### Name: CircleFitByLandau
### Title: Geometric circle fit (minimizing orthogonal distances) by Landau
###   algorithm
### Aliases: CircleFitByLandau
### Keywords: datasets

### ** Examples

xy<-calculateCircle(0,0,200,50,randomDist=TRUE,noiseFun=function(x) (x+rnorm(1,mean=0,sd=50)))
plot(xy[,1],xy[,2],xlim=c(-250,250),ylim=c(-250,250));par(new=TRUE)
c6 <- CircleFitByLandau(xy)
xyc6<-calculateCircle(c6[1],c6[2],c6[3])
plot(xyc6[,1],xyc6[,2],xlim=c(-250,250),ylim=c(-250,250),col='purple',type='l');par(new=TRUE)



