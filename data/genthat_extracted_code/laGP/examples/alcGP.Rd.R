library(laGP)


### Name: alcGP
### Title: Improvement statistics for sequential or local design
### Aliases: alcGP alcGPsep alcrayGP alcrayGPsep mspeGP fishGP ieciGP
###   ieciGPsep alcoptGP dalcGP alcoptGPsep dalcGPsep
### Keywords: nonparametric nonlinear smooth models regression spatial

### ** Examples

## this follows the example in predGP, but only evaluates 
## information statistics documented here

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
gpi <- newGP(X, Z, d=0.35, g=1/1000, dK=TRUE)

## predictive grid with NN=400
xx <- seq(-1.9, 1.9, length=20)
XX <- expand.grid(xx, xx)

## predict
alc <- alcGP(gpi, XX)
mspe <- mspeGP(gpi, XX)
fish <- fishGP(gpi, XX)

## visualize the result
par(mfrow=c(1,3))
image(xx, xx, matrix(sqrt(alc), nrow=length(xx)), col=heat.colors(128),
      xlab="x1", ylab="x2", main="sqrt ALC")
image(xx, xx, matrix(sqrt(mspe), nrow=length(xx)), col=heat.colors(128),
      xlab="x1", ylab="x2", main="sqrt MSPE")
image(xx, xx, matrix(log(fish), nrow=length(xx)), col=heat.colors(128),
      xlab="x1", ylab="x2", main="log fish")

## clean up
deleteGP(gpi)


## 
## Illustrating some of the other functions in a sequential design context, 
## using X and XX above
## 

## new, much bigger design
x <- seq(-2, 2, by=0.02)
X <- expand.grid(x, x)
Z <- f2d(X)

## first build a local design of size 25, see laGP documentation
out <- laGP.R(XX, start=6, end=25, X, Z, method="alc", close=10000)

## extract that design and fit GP
XC <- X[out$Xi,] ## inputs
ZC <- Z[out$Xi]  ## outputs
gpi <- newGP(XC, ZC, d=out$mle$d, g=out$g$start)

## calculate the ideal "next" location via continuous ALC optimization
alco <- alcoptGP(gpi=gpi, Xref=XX, start=c(0,0), lower=range(x)[1], upper=range(x)[2])

## alco$par is the "new" location; calculate distances between candidates (remaining
## unchosen X locations) and this solution
Xcan <- X[-out$Xi,]
D <- distance(Xcan, matrix(alco$par, ncol=ncol(Xcan))) 

## snap the new location back to the candidate set
lab <- which.min(D) 
xnew <- Xcan[lab,] 
## add xnew to the local design, remove it from Xcan, and repeat

## evaluate the derivative at this new location
dalc <- dalcGP(gpi=gpi, Xcand=matrix(xnew, nrow=1), Xref=XX)

## clean up
deleteGP(gpi)



