library(GeneralizedHyperbolic)


### Name: summary.gigFit
### Title: Summarizing Normal Inverse Gaussian Distribution Fit
### Aliases: summary.gigFit print.summary.gigFit
### Keywords: distribution

### ** Examples

### Continuing the  gigFit(.) example:
param <- c(1,1,1)
dataVector <- rgig(500, param = param)
fit <- gigFit(dataVector)
print(fit)
summary(fit, hessian = TRUE, hessianMethod = "tsHessian")



