library(HyperbolicDist)


### Name: summary.hyperbFit
### Title: Summarizing Hyperbolic Distribution Fit
### Aliases: summary.hyperbFit print.summary.hyperbFit
### Keywords: distribution

### ** Examples

### Continuing the  hyperbFit(.) example:
Theta <- c(2,2,2,2)
dataVector <- rhyperb(500, Theta)
fit <- hyperbFit(dataVector, method = "BFGS", hessian = TRUE)
print(fit)
summary(fit)




