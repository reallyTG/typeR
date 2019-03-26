library(kde1d)


### Name: dkde1d
### Title: Working with a kde1d object
### Aliases: dkde1d pkde1d, qkde1d, rkde1d pkde1d qkde1d rkde1d

### ** Examples

set.seed(0)              # for reproducibility
x <- rnorm(100)          # simulate some data
fit <- kde1d(x)          # estimate density
dkde1d(0, fit)           # evaluate density estimate (close to dnorm(0))
pkde1d(0, fit)           # evaluate corresponding cdf (close to pnorm(0))
qkde1d(0.5, fit)         # quantile function (close to qnorm(0))
hist(rkde1d(100, fit))   # simulate




