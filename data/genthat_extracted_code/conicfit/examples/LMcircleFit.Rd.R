library(conicfit)


### Name: LMcircleFit
### Title: Geometric circle fit (minimizing orthogonal distances) based on
###   the Levenberg-Marquardt method
### Aliases: LMcircleFit
### Keywords: datasets

### ** Examples

xy<-calculateCircle(0,0,200,50,randomDist=TRUE,noiseFun=function(x) (x+rnorm(1,mean=0,sd=50)))
plot(xy[,1],xy[,2],xlim=c(-250,250),ylim=c(-250,250));par(new=TRUE)
c4 <- LMcircleFit(xy)
xyc4<-calculateCircle(c4[1],c4[2],c4[3])
plot(xyc4[,1],xyc4[,2],xlim=c(-250,250),ylim=c(-250,250),col='cyan',type='l')



