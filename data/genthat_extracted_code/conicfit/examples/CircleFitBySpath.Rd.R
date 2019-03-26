library(conicfit)


### Name: CircleFitBySpath
### Title: Geometric circle fit by Spath
### Aliases: CircleFitBySpath
### Keywords: datasets

### ** Examples

xy<-calculateCircle(0,0,200,50,randomDist=TRUE,noiseFun=function(x) (x+rnorm(1,mean=0,sd=50)))
plot(xy[,1],xy[,2],xlim=c(-250,250),ylim=c(-250,250));par(new=TRUE)
c5 <- CircleFitBySpath(xy)
xyc5<-calculateCircle(c5[1],c5[2],c5[3])
plot(xyc5[,1],xyc5[,2],xlim=c(-250,250),ylim=c(-250,250),col='magenta',type='l');par(new=TRUE)



