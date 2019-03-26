library(laGP)


### Name: mleGP
### Title: Inference for GP correlation parameters
### Aliases: mleGP mleGPsep.R mleGPsep jmleGP jmleGP.R jmleGPsep
###   jmleGPsep.R
### Keywords: nonparametric nonlinear smooth models regression spatial
###   optimize

### ** Examples

## a simple example with estimated nugget
library(MASS)

## motorcycle data and predictive locations
X <- matrix(mcycle[,1], ncol=1)
Z <- mcycle[,2]

## get sensible ranges
d <- darg(NULL, X)
g <- garg(list(mle=TRUE), Z)

## initialize the model
gpi <- newGP(X, Z, d=d$start, g=g$start, dK=TRUE)

## separate marginal inference (not necessary - for illustration only)
print(mleGP(gpi, "d", d$min, d$max))
print(mleGP(gpi, "g", g$min, g$max))

## joint inference (could skip straight to here)
print(jmleGP(gpi, drange=c(d$min, d$max), grange=c(g$min, g$max)))

## plot the resulting predictive surface
N <- 100
XX <- matrix(seq(min(X), max(X), length=N), ncol=1)
p <- predGP(gpi, XX, lite=TRUE)
plot(X, Z, main="stationary GP fit to motorcycle data")
lines(XX, p$mean, lwd=2)
lines(XX, p$mean+1.96*sqrt(p$s2*p$df/(p$df-2)), col=2, lty=2)
lines(XX, p$mean-1.96*sqrt(p$s2*p$df/(p$df-2)), col=2, lty=2)

## clean up
deleteGP(gpi)

## 
## with a separable correlation function 
##

## 2D Example: GoldPrice Function, mimicking GP_fit package
f <- function(x) 
{
  x1 <- 4*x[,1] - 2
  x2 <- 4*x[,2] - 2;
  t1 <- 1 + (x1 + x2 + 1)^2*(19 - 14*x1 + 3*x1^2 - 14*x2 + 6*x1*x2 + 3*x2^2);
  t2 <- 30 + (2*x1 -3*x2)^2*(18 - 32*x1 + 12*x1^2 + 48*x2 - 36*x1*x2 + 27*x2^2);
  y <- t1*t2;
  return(y)
}

## build design
library(tgp)
n <- 50 ## change to 100 or 1000 for more interesting demo
B <- rbind(c(0,1), c(0,1))
X <- dopt.gp(n, Xcand=lhs(10*n, B))$XX
## this differs from GP_fit in that we use the log response
Y <- log(f(X))

## get sensible ranges
d <- darg(NULL, X)
g <- garg(list(mle=TRUE), Y)

## build GP and jointly optimize via profile mehtods
gpisep <- newGPsep(X, Y, d=rep(d$start, 2), g=g$start, dK=TRUE)
jmleGPsep(gpisep, drange=c(d$min, d$max), grange=c(g$min, g$max))

## clean up
deleteGPsep(gpisep)

## alternatively, we can optimize via a combined gradient
gpisep <- newGPsep(X, Y, d=rep(d$start, 2), g=g$start, dK=TRUE)
mleGPsep(gpisep, param="both", tmin=c(d$min, g$min), tmax=c(d$max, d$max))
deleteGPsep(gpisep)



