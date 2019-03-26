library(Renvlp)


### Name: weighted.env
### Title: Weighted envelope estimator
### Aliases: weighted.env

### ** Examples

data(wheatprotein)
X <- wheatprotein[, 8]
Y <- wheatprotein[, 1:6]
m <- weighted.env(X, Y)
m$w
m$beta

## Not run: m2 <- weighted.env(X, Y, bstrpNum = 100, min.u = 1, max.u = 6, boot.resi = "full")
## Not run: m2$bic_select
## Not run: m2$bootse



