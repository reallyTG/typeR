library(rvgtest)


### Name: rvgtest-package
### Title: Tools for Analyzing Non-Uniform Pseudo-Random Variate Generators
###   (RVG)
### Aliases: rvgtest-package rvgtest
### Keywords: package distribution datagen htest hplot

### ** Examples

## ------------------------------------------------
## 1. Histogram
## ------------------------------------------------

## Use a poor Gaussian random variate generator
## (otherwise we should not see a defect).
RNGkind(normal.kind="Buggy Kinderman-Ramage")

## Create table of bin counts.
## Use a sample of 20 times 10^5 random variates.
table <- rvgt.ftable(n=1e5, rep=20, rdist=rnorm, qdist=qnorm)

## Plot histogram for (cumulated) data
plot(table)

## Perform a chi-square goodness-of-fit test and plot result
r1 <- rvgt.chisq(table)
plot(r1)

## Perform M-test and plot both results
r2 <- rvgt.Mtest(table)
plot.rvgt.htest(list(r1,r2))

## ------------------------------------------------
## 2. Numerical Inversion
## ------------------------------------------------

## Create a table of u-errors for spline interpolation of
## the inverse CDF of the standard normal distribution.
aqn <- splinefun(x=pnorm((-100:100)*0.05), y=(-100:100)*0.05,
                 method="monoH.FC")
## Use a sample of size of 10^5 random variates.
uerrn <- uerror(n=1e5, aqdist=aqn, pdist=pnorm)

## Plot u-errors
plot(uerrn)




