library(pomp)


### Name: B-splines
### Title: B-spline bases
### Aliases: bspline.basis periodic.bspline.basis
### Keywords: smooth

### ** Examples

x <- seq(0,2,by=0.01)
y <- bspline.basis(x,degree=3,nbasis=9,names="basis")
matplot(x,y,type='l',ylim=c(0,1.1))
lines(x,apply(y,1,sum),lwd=2)

x <- seq(-1,2,by=0.01)
y <- periodic.bspline.basis(x,nbasis=5,names="spline%d")
matplot(x,y,type='l')



