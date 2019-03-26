library(VarianceGamma)


### Name: vgFit
### Title: Fit the Variance Gamma to Data
### Aliases: vgFit print.vgFit plot.vgFit

### ** Examples

param <- c(0,0.5,0,0.5)
dataVector <- rvg(500, param = param)
## See how well vgFit works
vgFit(dataVector)
vgFit(dataVector, plots = TRUE)
fit <- vgFit(dataVector)
par(mfrow = c(1,2))
plot(fit, which = c(1,3))

## Use nlm instead of default
param <- c(0,0.5,0,0.5)
dataVector <- rvg(500, param = param)
vgFit(dataVector, method = "nlm", hessian = TRUE)


## Use BFGS instead of deault
param <- c(0,0.5,0,0.5)
dataVector <- rvg(500, param = param)
vgFit(dataVector, method = "BFGS", hessian = TRUE)



