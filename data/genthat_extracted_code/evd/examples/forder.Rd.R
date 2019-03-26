library(evd)


### Name: forder
### Title: Maximum-likelihood Fitting of Order Statistics
### Aliases: forder
### Keywords: models

### ** Examples

uvd <- rorder(100, qnorm, mean = 0.56, mlen = 365, j = 2)
forder(uvd, list(mean = 0, sd = 1), distn = "norm", mlen = 365, j = 2)
forder(uvd, list(rate = 1), distn = "exp", mlen = 365, j = 2,
  method = "Brent", lower=0.01, upper=10)
forder(uvd, list(scale = 1), shape = 1, distn = "gamma", mlen = 365, j = 2,
  method = "Brent", lower=0.01, upper=10)
forder(uvd, list(shape = 1, scale = 1), distn = "gamma", mlen = 365, j = 2)



