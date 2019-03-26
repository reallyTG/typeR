library(spatialCovariance)


### Name: computeV
### Title: Compute Covariance Matrix
### Aliases: computeV
### Keywords: spatial

### ** Examples

## Example for extensive variables - variances of combined plots
library(spatialCovariance)
nrows <- 1
ncols <- 2
rowwidth <- 1.1
colwidth <- 1.2
rowsep <- 0
colsep <- 0

info <- precompute(nrows,ncols,rowwidth,colwidth,rowsep,colsep)
V <- computeV(info,class="matern",params=c(1,1))

info2 <- precompute(nrows=1,ncols=1,rowwidth=rowwidth,colwidth=colwidth*2,0,0)
V2 <- computeV(info2,class="matern",params=c(1,1))

c(1,1) 

(rowwidth * (2*colwidth))^2 * V2

## Bring in anisotropy
V
info <- precompute.update(info,aniso=2)  ## geometric anisotropy update
V <- computeV(info,class="matern",params=c(1,1))
V
info <- precompute.update(info,aniso=5)  ## geometric anisotropy update
V

## Second Example - define your own covariance function, here we use a
## spherical one

library(spatialCovariance)

K <- function(d,params) {
  frac <- d/params
  ret <- rep(0,length(d))
  ind <- which(frac<1)
  if(length(ind)) ret[ind] <- (1 - 2/pi*(frac[ind]*sqrt(1 - frac[ind]^2) + asin(frac[ind])))
  return(ret)
}

dVals <- seq(0,10,l=1001)
plot(dVals,K(dVals,8),type="l")
lines(dVals,K(dVals,7),col=2)

nrows <- 1
ncols <- 3
rowwidth <- 2
colwidth <- 2
rowsep <- 0
colsep <- 0

info <- precompute(nrows,ncols,rowwidth,colwidth,rowsep,colsep)
V <- computeV(info,class="misc",params=c(8),K=K)
V

## Now if we have a low value of theta_2 we should see that the first
## and third plot are independent as there is a 2 unit gap between
## them, so that term in V will be zero
V <- computeV(info,class="misc",params=c(1),K=K)
V

## If theta_2 gets a little bigger than 2 then we should see no
## non-zero entries in V
V <- computeV(info,class="misc",params=c(2.005),K=K)
V

## Check V is positive definite
eigen(V)$values ## should all be positive




