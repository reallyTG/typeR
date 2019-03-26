library(GeneralizedHyperbolic)


### Name: summary.hyperbFit
### Title: Summarizing Hyperbolic Distribution Fit
### Aliases: summary.hyperbFit print.summary.hyperbFit
### Keywords: distribution

### ** Examples

### Continuing the  hyperbFit(.) example:
param <- c(2, 2, 2, 1)
dataVector <- rhyperb(500, param = param)
fit <- hyperbFit(dataVector, method = "BFGS")
print(fit)
summary(fit, hessian = TRUE)



