library(diffusionMap)


### Name: adapreg.m
### Title: Adaptive Regression
### Aliases: adapreg.m
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
# leave-one-out cross-validation:
AR = adapreg.m(.01,D,y,fold=1:length(y))
print(paste("optimal model size:",AR$mopt,"; min. CV risk:",
  round(AR$mincvrisk,4)))
par(mfrow=c(2,1),mar=c(5,5,4,1))
plot(AR$cvrisks,typ='b',xlab="Model size",ylab="CV risk",
  cex.lab=1.5,cex.main=1.5,main="CV risk estimates")
plot(y,AR$y.hat,ylab=expression(hat("y")),cex.lab=1.5,cex.main=1.5,
  main="Predictions")
abline(0,1,col=2,lwd=2)



## swiss roll data
N=2000
t = (3*pi/2)*(1+2*runif(N));  height = runif(N);
X = cbind(t*cos(t), height, t*sin(t))
X = scale(X) + matrix(rnorm(N*3,0,0.05),N,3)
tcol = topo.colors(32)
colvec = floor((t-min(t))/(max(t)-min(t))*32); colvec[colvec==0] = 1
scatterplot3d(X,pch=18,color=tcol[colvec],xlab=expression("x"[1]),
  ylab=expression("x"[2]),zlab=expression("x"[3]),cex.lab=1.5,
  main="Swiss Roll, Noise = 0.05",cex.main=1.5,xlim=c(-2,2),
  ylim=c(-2,2),zlim=c(-2,2),col.axis="gray")

D = as.matrix(dist(X))
# 10-fold cross-validation:
AR = adapreg.m(.2,D,t,mmax=25,nfolds=5)
print(paste("optimal model size:",AR$mopt,"; min. CV risk:",
  round(AR$mincvrisk,4)))
par(mfrow=c(2,1),mar=c(5,5,4,1))
plot(AR$cvrisks,typ='b',xlab="Model size",ylab="CV risk",
  cex.lab=1.5,cex.main=1.5,main="CV risk estimates")
plot(t,AR$y.hat,ylab=expression(hat("t")),cex.lab=1.5,cex.main=1.5,
  main="Predictions")
abline(0,1,col=2,lwd=2)





