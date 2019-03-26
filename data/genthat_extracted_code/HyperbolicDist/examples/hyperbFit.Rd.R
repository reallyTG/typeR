library(HyperbolicDist)


### Name: hyperbFit
### Title: Fit the Hyperbolic Distribution to Data
### Aliases: hyperbFit print.hyperbFit plot.hyperbFit
### Keywords: distribution

### ** Examples

Theta <- c(2,2,2,2)
dataVector <- rhyperb(500, Theta)
## See how well hyperbFit works
hyperbFit(dataVector)
hyperbFit(dataVector, plots = TRUE)
fit <- hyperbFit(dataVector)
par(mfrow = c(1,2))
plot(fit, which = c(1,3))

## Use nlm instead of default
hyperbFit(dataVector, method = "nlm")




