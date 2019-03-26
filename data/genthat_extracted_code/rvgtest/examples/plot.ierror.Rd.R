library(rvgtest)


### Name: plot.rvgt.ierror
### Title: Plot Errors in Inversion Methods
### Aliases: plot.rvgt.ierror
### Keywords: distribution hplot htest

### ** Examples

## Create a table of u-errors for spline interpolation of
## the inverse CDF of the standard normal distribution and
## the beta distribution
aqn <- splinefun(x=pnorm((-100:100)*0.05), y=(-100:100)*0.05,
                 method="monoH.FC")
uerrn <- uerror(n=1e5, aqdist=aqn, pdist=pnorm)

aqb <- splinefun(x=pbeta((0:100)*0.01,shape1=2,shape2=5),
                 y=(0:100)*0.01, method="monoH.FC")
uerrb <- uerror(n=1e5, aqdist=aqb, pdist=pbeta, shape1=2, shape2=5)

## Plot u-errors of the normal distribution
plot(uerrn)

## Plot maximal u-errors of the normal distribution
plot(uerrn,maxonly=TRUE)

## Compare the u-errors of these two distributions and
## draw maximal tolerated error
plot.rvgt.ierror(list(uerrn,uerrb),tol=1.e-6)




