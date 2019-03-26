library(conicfit)


### Name: EllipseFitByTaubin
### Title: Algebraic ellipse fit by Taubin
### Aliases: EllipseFitByTaubin
### Keywords: datasets

### ** Examples

xy<-calculateEllipse(0,0,200,100,45,50, randomDist=TRUE,noiseFun=function(x) 
(x+rnorm(1,mean=0,sd=50)))
plot(xy[,1],xy[,2],xlim=c(-250,250),ylim=c(-250,250),col='magenta');par(new=TRUE)

ellipTaubin <- EllipseFitByTaubin(xy)
ellipTaubinG <- AtoG(ellipTaubin)$ParG
xyTaubin<-calculateEllipse(ellipTaubinG[1], ellipTaubinG[2], ellipTaubinG[3], 
ellipTaubinG[4], 180/pi*ellipTaubinG[5])
plot(xyTaubin[,1],xyTaubin[,2],xlim=c(-250,250),ylim=c(-250,250),type='l',
col='red');par(new=TRUE)




