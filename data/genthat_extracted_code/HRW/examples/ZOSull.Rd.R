library(HRW)


### Name: ZOSull
### Title: O'Sullivan spline design matrices
### Aliases: ZOSull

### ** Examples

library(HRW)
x <- WarsawApts$construction.date
a <- 1.01*min(x) - 0.01*max(x)
b <- 1.01*max(x) - 0.01*min(x) ; numIntKnots <- 23
intKnots <- quantile(unique(x),seq(0,1,length = (numIntKnots + 2))[-c(1,(numIntKnots + 2))])
xg <- seq(a,b,length = 1001)
Zg <- ZOSull(xg,range.x = c(a,b),intKnots = intKnots)
plot(0,type = "n",xlim = range(xg),ylim = range(Zg),
     bty = "l",xlab = "construction date (year)",
     ylab = "spline basis function")
for (k in 1:ncol(Zg)) lines(xg,Zg[,k],col = k,lwd = 2)
   lines(c(min(xg),max(xg)),rep(0,2),col = "darkmagenta")
for (k in 1:numIntKnots)
   points(intKnots[k],0,pch = 18,cex = 2,col = "darkmagenta")



