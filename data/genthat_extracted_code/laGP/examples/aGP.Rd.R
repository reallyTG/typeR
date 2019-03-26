library(laGP)


### Name: aGP
### Title: Localized Approximate GP Regression For Many Predictive
###   Locations
### Aliases: aGP aGP.R aGPsep.R aGPsep aGP.parallel aGP.seq
### Keywords: nonparametric nonlinear smooth models regression spatial

### ** Examples

## first, a "computer experiment"

## Simple 2-d test function used in Gramacy & Apley (2014);
## thanks to Lee, Gramacy, Taddy, and others who have used it before
f2d <- function(x, y=NULL)
  {
    if(is.null(y)){
      if(!is.matrix(x) && !is.data.frame(x)) x <- matrix(x, ncol=2)
      y <- x[,2]; x <- x[,1]
    }
    g <- function(z)
      return(exp(-(z-1)^2) + exp(-0.8*(z+1)^2) - 0.05*sin(8*(z+0.1)))
    z <- -g(x)*g(y)
  }

## build up a design with N=~40K locations
x <- seq(-2, 2, by=0.02)
X <- expand.grid(x, x)
Z <- f2d(X)

## predictive grid with NN=400 locations,
## change NN to 10K (length=100) to mimic setup in Gramacy & Apley (2014)
## the low NN set here is for fast CRAN checks
xx <- seq(-1.975, 1.975, length=10)
XX <- expand.grid(xx, xx)
ZZ <- f2d(XX)

## get the predictive equations, first based on Nearest Neighbor
out <- aGP(X, Z, XX, method="nn", verb=0)
## RMSE
sqrt(mean((out$mean - ZZ)^2))

## Not run: 
##D ## refine with ALC
##D out2 <- aGP(X, Z, XX, method="alc", d=out$mle$d)
##D ## RMSE
##D sqrt(mean((out2$mean - ZZ)^2))
##D 
##D ## visualize the results
##D par(mfrow=c(1,3))
##D image(xx, xx, matrix(out2$mean, nrow=length(xx)), col=heat.colors(128),
##D       xlab="x1", ylab="x2", main="predictive mean")
##D image(xx, xx, matrix(out2$mean-ZZ, nrow=length(xx)), col=heat.colors(128),
##D       xlab="x1", ylab="x2", main="bias")
##D image(xx, xx, matrix(sqrt(out2$var), nrow=length(xx)), col=heat.colors(128),
##D       xlab="x1", ylab="x2", main="sd")
##D 
##D ## refine with MSPE
##D out3 <- aGP(X, Z, XX, method="mspe", d=out2$mle$d)
##D ## RMSE
##D sqrt(mean((out3$mean - ZZ)^2))
## End(Not run)

## version with ALC-ray which is much faster than the ones not
## run above
out2r <- aGP(X, Z, XX, method="alcray", d=out$mle$d, verb=0)
sqrt(mean((out2r$mean - ZZ)^2))

## a simple example with estimated nugget
library(MASS)

## motorcycle data and predictive locations
X <- matrix(mcycle[,1], ncol=1)
Z <- mcycle[,2]
XX <- matrix(seq(min(X), max(X), length=100), ncol=1)

## first stage
out <- aGP(X=X, Z=Z, XX=XX, end=30, g=list(mle=TRUE), verb=0) 

## plot smoothed versions of the estimated parameters
par(mfrow=c(2,1))
df <- data.frame(y=log(out$mle$d), XX)
lo <- loess(y~., data=df, span=0.25)
plot(XX, log(out$mle$d), type="l")
lines(XX, lo$fitted, col=2)
dfnug <- data.frame(y=log(out$mle$g), XX)
lonug <- loess(y~., data=dfnug, span=0.25)
plot(XX, log(out$mle$g), type="l")
lines(XX, lonug$fitted, col=2)

## second stage design
out2 <- aGP(X=X, Z=Z, XX=XX, end=30, verb=0,
		d=list(start=exp(lo$fitted), mle=FALSE),
		g=list(start=exp(lonug$fitted)))

## plot the estimated surface
par(mfrow=c(1,1))
plot(X,Z)
df <- 20
s2 <- out2$var*(df-2)/df
q1 <- qt(0.05, df)*sqrt(s2) + out2$mean
q2 <- qt(0.95, df)*sqrt(s2) + out2$mean
lines(XX, out2$mean)
lines(XX, q1, col=1, lty=2)
lines(XX, q2, col=1, lty=2)

## compare to the single-GP result provided in the mleGP documentation



