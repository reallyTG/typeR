library(GeneralizedHyperbolic)


### Name: summary.nigFit
### Title: Summarizing Normal Inverse Gaussian Distribution Fit
### Aliases: summary.nigFit print.summary.nigFit
### Keywords: distribution

### ** Examples

### Continuing the  nigFit(.) example:
param <- c(2, 2, 2, 1)
dataVector <- rnig(500, param = param)
fit <- nigFit(dataVector, method = "BFGS")
print(fit)
summary(fit, hessian = TRUE, hessianMethod = "tsHessian")



