library(diffusionMap)


### Name: adapreg
### Title: Adaptive Regression
### Aliases: adapreg
### Keywords: multivariate nonparametric

### ** Examples

library(scatterplot3d)
## trig function on circle
t=seq(-pi,pi,.01)
x=cbind(cos(t),sin(t))
y = cos(3*t) + rnorm(length(t),0,.1)
tcol = topo.colors(32)
colvec = floor((y-min(y))/(max(y)-min(y))*32); colvec[colvec==0] = 1
scatterplot3d(x[,1],x[,2],y,color=tcol[colvec],pch=20,
  main="Cosine function supported on circle",angle=55,
  cex.main=2,col.axis="gray",cex.symbols=2,cex.lab=2,
  xlab=expression("x"[1]),ylab=expression("x"[2]),zlab="y")

D = as.matrix(dist(x))
# do 10-fold cross-validation to optimize (epsilon, m):
AR = adapreg(D,y, mmax=5,nfolds=2,nrep=2)
print(paste("optimal model size:",AR$mopt,"; optimal epsilon:",
  round(AR$epsopt,4),"; min. CV risk:",round(AR$mincvrisk,5)))
plot(y,AR$y.hat,ylab=expression(hat("y")),cex.lab=1.5,cex.main=1.5,
  main="Predictions")
abline(0,1,col=2,lwd=2)





