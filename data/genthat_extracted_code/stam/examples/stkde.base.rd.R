library(stam)


### Name: stkde.base
### Title: Spatio-Temporal Kernel Density Estimation
### Aliases: stkde.base stkde.base
### Keywords: nonparametric,spatio-temporal analysis

### ** Examples

## Not run: 
##D # EXAMPLE:Simulated dataset
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
##D samkde<-stkde.base(xlong=d$x,ylat=d$y,ztime=d$tf,xgrids=20,ygrids=20,
##D         breaks=0.05,bwmethod="cv.ml")
## End(Not run) 



