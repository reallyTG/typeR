library(conicfit)


### Name: LMreducedCircleFit
### Title: Geometric circle fit (minimizing orthogonal distances) based on
###   the Levenberg-Marquardt method
### Aliases: LMreducedCircleFit
### Keywords: datasets

### ** Examples

xy<-calculateCircle(0,0,200,50,randomDist=TRUE,noiseFun=function(x) (x+rnorm(1,mean=0,sd=50)))
plot(xy[,1],xy[,2],xlim=c(-250,250),ylim=c(-250,250));par(new=TRUE)
c7 <- LMreducedCircleFit(xy)
xyc7<-calculateCircle(c7[1],c7[2],c7[3])
plot(xyc7[,1],xyc7[,2],xlim=c(-250,250),ylim=c(-250,250),col='pink',type='l')



