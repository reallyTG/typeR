library(rvgtest)


### Name: uerror
### Title: Create Table of U-Errors for Numerical Inversion Method
### Aliases: uerror uerror.default
### Keywords: distribution datagen

### ** Examples

## Create a table of u-errors for spline interpolation of
## the inverse CDF of the standard normal distribution.
aqn <- splinefun(x=pnorm((-100:100)*0.05), y=(-100:100)*0.05,
                 method="monoH.FC")
## Use a sample of size of 10^5 random variates.
uerrn <- uerror(n=1e5, aqdist=aqn, pdist=pnorm)

## Plot u-errors
plot(uerrn)

## Investigate tails more accurately, and use
## a resolution of 1000 intervals.
uerrn <- uerror(n=1e5, aqdist=aqn, pdist=pnorm, res=1000, tails=TRUE)


## Same for a gamma distribution.
## But this time we immediately plot the error.
aqg <- splinefun(x=pgamma((0:500)*0.1,shape=5),
                 y=(0:500)*0.1, method="monoH.FC")
uerrg <- uerror(n=1e5, aqdist=aqg, pdist=pgamma, shape=5,
                plot=TRUE)


## Compute u-error for a subdomain of a beta distribution
aqb <- splinefun(x=pbeta((0:100)*0.01,shape1=2,shape2=5),
                 y=(0:100)*0.01, method="monoH.FC")
uerrb <- uerror(n=1e5, aqdist=aqb, pdist=pbeta, shape1=2, shape2=5,
                udomain=c(0.6,0.65), plot=TRUE)

## Show all u-errors in one plot
plot.rvgt.ierror(list(uerrn,uerrg,uerrb))

## An inverse CDF for a truncated normal distribution
aqtn <- splinefun(x=(pnorm((0:100)*0.015) - pnorm(0))/(pnorm(1.5)-pnorm(0)),
                  y=(0:100)*0.015, method="monoH.FC")
uerrtn <- uerror(n=1e5, aqdist=aqtn, pdist=pnorm, trunc=c(0,1.5),
                 plot=TRUE)



