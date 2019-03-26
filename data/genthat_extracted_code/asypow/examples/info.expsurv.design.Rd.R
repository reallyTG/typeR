library(asypow)


### Name: info.expsurv.design
### Title: Expected Information Matrix for a Clinical Trial with
###   Exponential Survival Design
### Aliases: info.expsurv.design
### Keywords: htest

### ** Examples

# Find the information matrix for a clinical trial
# with hazard w(x) = -0.848 + 0.7*x which lasts
# three years and has 10 x values equally spaced
# between -3 and 3 with equal sample sizes.
ab <- c(-.848, .7)
covar <- seq(-3, 3, length=10)
LL <- 3
info.expsurv <- info.expsurv.design(theta = ab, L = LL, xpoints = covar)
print(info.expsurv)



