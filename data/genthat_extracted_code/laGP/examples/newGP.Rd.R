library(laGP)


### Name: newGP
### Title: Create A New GP Object
### Aliases: newGP updateGP newGPsep updateGPsep
### Keywords: nonparametric nonlinear smooth models regression spatial

### ** Examples

## for more examples, see predGP and mleGP docs

## simple sine data
X <- matrix(seq(0,2*pi,length=7), ncol=1)
Z <- sin(X)

## new GP fit
gpi <- newGP(X, Z, 2, 0.000001)

## make predictions
XX <- matrix(seq(-1,2*pi+1, length=499), ncol=ncol(X))
p <- predGP(gpi, XX)

## sample from the predictive distribution
library(mvtnorm)
N <- 100
ZZ <- rmvt(N, p$Sigma, p$df) 
ZZ <- ZZ + t(matrix(rep(p$mean, N), ncol=N))
matplot(XX, t(ZZ), col="gray", lwd=0.5, lty=1, type="l", 
       xlab="x", ylab="f-hat(x)", bty="n")
points(X, Z, pch=19, cex=2)

## update with four more points
X2 <- matrix(c(pi/2, 3*pi/2, -0.5, 2*pi+0.5), ncol=1)
Z2 <- sin(X2)
updateGP(gpi, X2, Z2)

## make a new set of predictions
p2 <- predGP(gpi, XX)
ZZ <- rmvt(N, p2$Sigma, p2$df) 
ZZ <- ZZ + t(matrix(rep(p2$mean, N), ncol=N))
matplot(XX, t(ZZ), col="gray", lwd=0.5, lty=1, type="l", 
       xlab="x", ylab="f-hat(x)", bty="n")
points(X, Z, pch=19, cex=2)
points(X2, Z2, pch=19, cex=2, col=2)

## clean up
deleteGP(gpi)



