library(laGP)


### Name: predGP
### Title: GP Prediction/Kriging
### Aliases: predGP predGPsep
### Keywords: nonparametric nonlinear smooth models regression spatial

### ** Examples

## a "computer experiment" -- a much smaller version than the one shown
## in the aGP docs

## Simple 2-d test function used in Gramacy & Apley (2015);
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

## design with N=441
x <- seq(-2, 2, length=11)
X <- expand.grid(x, x)
Z <- f2d(X)

## fit a GP
gpi <- newGP(X, Z, d=0.35, g=1/1000)

## predictive grid with NN=400
xx <- seq(-1.9, 1.9, length=20)
XX <- expand.grid(xx, xx)
ZZ <- f2d(XX)

## predict
p <- predGP(gpi, XX, lite=TRUE)
## RMSE: compare to similar experiment in aGP docs
sqrt(mean((p$mean - ZZ)^2))

## visualize the result
par(mfrow=c(1,2))
image(xx, xx, matrix(p$mean, nrow=length(xx)), col=heat.colors(128),
      xlab="x1", ylab="x2", main="predictive mean")
image(xx, xx, matrix(p$mean-ZZ, nrow=length(xx)), col=heat.colors(128),
      xlab="x1", ylab="x2", main="bas")

## clean up
deleteGP(gpi)

## see the newGP and mleGP docs for examples using lite = FALSE for
## sampling from the joint predictive distribution



