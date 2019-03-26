library(conicfit)


### Name: EllipseDirectFit
### Title: Algebraic ellipse fit method by Fitzgibbon-Pilu-Fisher
### Aliases: EllipseDirectFit
### Keywords: datasets

### ** Examples

xy<-calculateEllipse(0,0,200,100,45,50, randomDist=TRUE,noiseFun=function(x) 
(x+rnorm(1,mean=0,sd=50)))
plot(xy[,1],xy[,2],xlim=c(-250,250),ylim=c(-250,250),col='magenta');par(new=TRUE)

ellipDirect <- EllipseDirectFit(xy)
ellipDirectG <- AtoG(ellipDirect)$ParG
xyDirect<-calculateEllipse(ellipDirectG[1], ellipDirectG[2], ellipDirectG[3], 
ellipDirectG[4], 180/pi*ellipDirectG[5])
plot(xyDirect[,1],xyDirect[,2],xlim=c(-250,250),ylim=c(-250,250),type='l',
col='cyan');par(new=TRUE)



