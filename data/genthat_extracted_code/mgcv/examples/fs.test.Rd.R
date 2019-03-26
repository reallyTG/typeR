library(mgcv)


### Name: fs.test
### Title: FELSPLINE test function
### Aliases: fs.test fs.boundary
### Keywords: models smooth regression

### ** Examples

require(mgcv)
## plot the function, and its boundary...
fsb <- fs.boundary()
m<-300;n<-150 
xm <- seq(-1,4,length=m);yn<-seq(-1,1,length=n)
xx <- rep(xm,n);yy<-rep(yn,rep(m,n))
tru <- matrix(fs.test(xx,yy),m,n) ## truth
image(xm,yn,tru,col=heat.colors(100),xlab="x",ylab="y")
lines(fsb$x,fsb$y,lwd=3)
contour(xm,yn,tru,levels=seq(-5,5,by=.25),add=TRUE)



