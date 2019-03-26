library(dlm)


### Name: residuals.dlmFiltered
### Title: One-step forecast errors
### Aliases: residuals.dlmFiltered
### Keywords: misc

### ** Examples

## diagnostic plots 
nileMod <- dlmModPoly(1, dV = 15100, dW = 1468)
nileFilt <- dlmFilter(Nile, nileMod)
res <- residuals(nileFilt, sd=FALSE)
qqnorm(res)
tsdiag(nileFilt)



