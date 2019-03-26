library(evd)


### Name: fextreme
### Title: Maximum-likelihood Fitting of Maxima and Minima
### Aliases: fextreme
### Keywords: models

### ** Examples

uvdata <- rextreme(100, qnorm, mean = 0.56, mlen = 365)
fextreme(uvdata, list(mean = 0, sd = 1), distn = "norm", mlen = 365)
fextreme(uvdata, list(rate = 1), distn = "exp", mlen = 365, 
  method = "Brent", lower=0.01, upper=10)
fextreme(uvdata, list(scale = 1), shape = 1, distn = "gamma", mlen = 365,
  method = "Brent", lower=0.01, upper=10)
fextreme(uvdata, list(shape = 1, scale = 1), distn = "gamma", mlen = 365)



