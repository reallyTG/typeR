library(Renvlp)


### Name: weighted.xenv
### Title: Weighted predictor envelope estimator
### Aliases: weighted.xenv

### ** Examples

data(wheatprotein)
X <- wheatprotein[, 1:6]
Y <- wheatprotein[, 7]
m <- weighted.xenv(X, Y)
m$w
m$beta

## Not run: m2 <- weighted.xenv(X, Y, bstrpNum = 100, min.u = 2, max.u = 4, boot.resi = "full")
## Not run: m2$w
## Not run: m2$bootse



