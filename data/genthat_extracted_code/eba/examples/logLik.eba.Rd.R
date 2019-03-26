library(eba)


### Name: logLik.eba
### Title: Log-Likelihood of an eba Object
### Aliases: logLik.eba nobs.eba
### Keywords: models

### ** Examples

data(heaviness)
btl1 <- eba(heaviness[, , order=1])
logLik(btl1)
AIC(btl1)
BIC(btl1)



