library(GeneralizedHyperbolic)


### Name: nigFit
### Title: Fit the normal inverse Gaussian Distribution to Data
### Aliases: nigFit print.nigFit plot.nigFit coef.nigFit vcov.nigFit
### Keywords: distribution

### ** Examples

param <- c(2, 2, 2, 1)
dataVector <- rnig(500, param = param)
## See how well nigFit works
nigFit(dataVector)
nigFit(dataVector, plots = TRUE)
fit <- nigFit(dataVector)
par(mfrow = c(1, 2))
plot(fit, which = c(1, 3))

## Use nlm instead of default
nigFit(dataVector, method = "nlm")




