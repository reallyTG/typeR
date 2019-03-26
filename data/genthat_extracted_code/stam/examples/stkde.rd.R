library(stam)


### Name: stkde
### Title: Spatio-Temporal Kernel Density Estimation with Density Contours
### Aliases: stkde stkde
### Keywords: nonparametric,spatio-temporal analysis

### ** Examples

## Not run: 
##D #Example1-uneven number of years
##D #Dataset1
##D # We will generate a 3 different stages' case points.
##D # The higher density are in the off-diagonal direction.
##D x1<-c(runif(100,0,1),runif(50,0.67,1))
##D y1<-c(runif(100,0,1),runif(50,0.67,1))
##D d1<-data.frame(x1,y1)
##D colnames(d1)<-c("x","y")
##D x2<-c(runif(100,0,1),runif(50,0.33,0.67))
##D y2<-c(runif(100,0,1),runif(50,0.33,0.67))
##D d2<-data.frame(x2,y2)
##D colnames(d2)<-c("x","y")
##D x3<-c(runif(100,0,1),runif(50,0,0.33))
##D y3<-c(runif(100,0,1),runif(50,0,0.33))
##D d3<-data.frame(x3,y3)
##D colnames(d3)<-c("x","y")
##D d<-rbind(d1,d2,d3)
##D d$tf<-c(rep(1,150),rep(2,150),rep(3,150))
##D #d is the simulated data
##D #d[1,]
##D #plot(d1);points(d2,col="red");points(d3,col="green")
##D #Key Code
##D #attach(d)
##D samkde<-stkde(xlong=d$x,ylat=d$y,ztime=d$tf,xgrids=20,ygrids=20,
##D         breaks=0.05,alpha=0.05,nrowspar=1,bwmethod="cv.ml")
##D samkde$bw
##D samkde$dens
##D #Example2-even number of years
##D #Dataset2
##D x12<-c(runif(100,0,1),runif(50,0.67,1))
##D y12<-c(runif(100,0,1),runif(50,0.67,1))
##D d12<-data.frame(x12,y12)
##D colnames(d12)<-c("x","y")
##D x22<-c(runif(100,0,1),runif(50,0.33,0.67))
##D y22<-c(runif(100,0,1),runif(50,0.33,0.67))
##D d22<-data.frame(x22,y22)
##D colnames(d22)<-c("x","y")
##D d2<-rbind(d12,d22)
##D d2$tf<-c(rep(1,150),rep(2,150))
##D colnames(d2)<-c("xlong","ylat","ztime")
##D #Running the function
##D samkde2<-stkde(d[,1],d[,2],d[,3],xgrids=20,ygrids=20,breaks=0.05,
##D          alpha=0.05,nrowspar=1,bwmethod="cv.ml")
##D samkde2$bw
##D samkde2$dens         
## End(Not run) 



