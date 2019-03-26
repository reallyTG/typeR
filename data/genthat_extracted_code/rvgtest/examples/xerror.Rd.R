library(rvgtest)


### Name: xerror
### Title: Create Table of X-Errors for Numerical Inversion Method
### Aliases: xerror xerror.default
### Keywords: distribution datagen

### ** Examples

## Create a table of absolute x-errors for spline interpolation of
## the inverse CDF of the standard normal distribution.
aq <- splinefun(x=pnorm((-100:100)*0.05), y=(-100:100)*0.05,
                method="monoH.FC")
## Use a sample of size of 10^5 random variates.
xerr <- xerror(n=1e5, aqdist=aq, qdist=qnorm, kind="abs")

## Plot x-errors
plot(xerr)


## Same for the relative error.
## But this time we use a resolution of 500, and
## we immediately plot the error.
xerr <- xerror(n=1e5, aqdist=aq, qdist=qnorm,
               res=500, kind="rel", plot=TRUE)


## An inverse CDF for a truncated normal distribution
aqtn <- splinefun(x=(pnorm((0:100)*0.015) - pnorm(0))/(pnorm(1.5)-pnorm(0)),
                  y=(0:100)*0.015, method="monoH.FC")
xerrtn <- xerror(n=1e5, aqdist=aqtn, qdist=qnorm, trunc=c(0,1.5),
                 plot=TRUE)



