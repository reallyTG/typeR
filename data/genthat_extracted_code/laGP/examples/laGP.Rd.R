library(laGP)


### Name: laGP
### Title: Localized Approximate GP Prediction At a Single Input Location
### Aliases: laGP laGP.R laGPsep.R laGPsep
### Keywords: nonparametric nonlinear smooth models regression spatial

### ** Examples

## examining a particular laGP call from the larger analysis provided
## in the aGP documentation

## A simple 2-d test function used in Gramacy & Apley (2014);
## thanks to Lee, Gramacy, Taddy, and others who have used it before
f2d <- function(x, y=NULL)
  {
    if(is.null(y)) {
      if(!is.matrix(x) && !is.data.frame(x)) x <- matrix(x, ncol=2)
      y <- x[,2]; x <- x[,1]
    }
    g <- function(z)
      return(exp(-(z-1)^2) + exp(-0.8*(z+1)^2) - 0.05*sin(8*(z+0.1)))
    z <- -g(x)*g(y)
  }

## build up a design with N=~40K locations
x <- seq(-2, 2, by=0.02)
X <- as.matrix(expand.grid(x, x))
Z <- f2d(X)

## optional first pass of nearest neighbor
Xref <- matrix(c(-1.725, 1.725), nrow=TRUE)
out <- laGP(Xref, 6, 50, X, Z, method="nn")

## second pass via ALC, ALCOPT, MSPE, and ALC-ray respectively,
## conditioned on MLE d-values found above
out2 <- laGP(Xref, 6, 50, X, Z, d=out$mle$d)
out2.alcopt <- laGP(Xref, 6, 50, X, Z, d=out2$mle$d, method="alcopt")
out2.mspe <- laGP(Xref, 6, 50, X, Z, d=out2$mle$d, method="mspe")
out2.alcray <- laGP(Xref, 6, 50, X, Z, d=out2$mle$d, method="alcray")

## look at the different designs
plot(rbind(X[out2$Xi,], X[out2.mspe$Xi,]), type="n",
     xlab="x1", ylab="x2", main="comparing local designs")
points(Xref[1], Xref[2], col=2, cex=0.5)
text(X[out2$Xi,], labels=1:50, cex=0.6)
text(X[out2.alcopt$Xi,], labels=1:50, cex=0.6, col="forestgreen")
text(X[out2.mspe$Xi,], labels=1:50, cex=0.6, col="blue")
text(X[out2.alcray$Xi,], labels=1:50, cex=0.6, col="red")
legend("right", c("ALC", "ALCOPT", "MSPE", "ALCRAY"),
       text.col=c("black", "forestgreen", "blue", "red"), bty="n")

## compare computational time
c(nn=out$time, alc=out2$time, alcopt=out2.alcopt$time, 
  mspe=out2.mspe$time, alcray=out2.alcray$time)

## Not run: 
##D   ## A comparison between ALC-ex, ALC-opt and NN
##D 
##D   ## defining a predictive path
##D   wx <- seq(-0.85, 0.45, length=100)
##D   W <- cbind(wx-0.75, wx^3+0.51)
##D 
##D   ## three comparators from Sun, et al. (2017)
##D   ## larger-than-default "close" argument to capture locations nearby path
##D   p.alc <- laGPsep(W, 6, 100, X, Z, method="alc", close=10000, lite=FALSE)
##D   p.alcopt <- laGPsep(W, 6, 100, X, Z, method="alcopt", lite=FALSE)
##D   ## note that close=10*(1000+end) would be the default for method = "alcopt"
##D   p.nn <- laGPsep(W, 6, 100, X, Z, method="nn", close=10000, lite=FALSE)
##D 
##D   ## Mahalanobis distance to combine RMSE and covariance estimates
##D   mahdist <- function(Y, mu, Sigma) {
##D      Ymmu <- Y - mu
##D      Sigmai <- solve(Sigma)
##D      return(sqrt(t(Ymmu) %*% Sigmai %*% Ymmu))
##D   }
##D 
##D   ## comparison by Mahalanobis distance
##D   WY <- f2d(W)
##D   c(alc=mahdist(WY, p.alc$mean, p.alc$Sigma),
##D     alcopt=mahdist(WY, p.alcopt$mean, p.alcopt$Sigma),
##D     nn=mahdist(WY, p.nn$mean, p.nn$Sigma))
##D 
##D   ## comparison via time
##D   c(alc=p.alc$time, alcopt=p.alcopt$time, nn=p.nn$time)
##D 
##D   ## visualization
##D   ## first ALC-ex
##D   plot(W, type="l", bty="n", lwd=2, xlab="x1", ylab="x2", 
##D     xlim=c(-2.25,0), ylim=c(-0.75,1.25), main="")
##D   points(W[length(wx)/2,1], W[length(wx)/2,2], col=2, pch=19)
##D   points(X[p.alc$Xi,], col="blue", cex=0.6)
##D   legend("bottomright", c("x0", "ALC-opt", "ALC-ex", "NN"), 
##D     pch=c(19, 23, 21, 22), bty="n", cex=1.25,
##D     col=c("red", "purple", "blue", "forestgreen"))
##D   legend("topleft", "W(x0)", lty=1, col=1, lwd=2, bty="n", 
##D     cex=1.25)
##D   ## then shifted NN
##D   lines(W[,1]+0.25, W[,2]-0.25)
##D   points(W[length(wx)/2,1]+0.25, W[length(wx)/2,2]-0.25, col=2, pch=19)
##D   points(X[p.nn$Xi,1]+0.25, X[p.nn$Xi,2]-0.25, pch=22, 
##D     col="forestgreen", cex=0.6)
##D   ## finally shifted (in the other direction) ALC-opt
##D   lines(W[,1]-0.25, W[,2]+0.25) 
##D   points(W[length(wx)/2,1]-0.25, W[length(wx)/2,2]+0.25, col=2, pch=19)
##D   points(X[p.alcopt$Xi,1]-0.25, X[p.alcopt$Xi,2]+0.25, pch=23, 
##D     col="purple", cex=0.6)
## End(Not run)



