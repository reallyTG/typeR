library(kdevine)


### Name: dkde1d
### Title: Working with a kde1d object
### Aliases: dkde1d pkde1d, qkde1d, rkde1d pkde1d qkde1d

### ** Examples

data(wdbc)  # load data
fit <- kde1d(wdbc[, 5])  # estimate density
dkde1d(1000, fit)        # evaluate density estimate
pkde1d(1000, fit)        # evaluate corresponding cdf
qkde1d(0.5, fit)         # quantile function
hist(rkde1d(100, fit))   # simulate




