library(NormalLaplace)


### Name: nlFit
### Title: Fit the Normal Laplace Distribution to Data
### Aliases: nlFit print.nlFit plot.nlFit coef.nlFit vcov.nlFit
### Keywords: distribution

### ** Examples

param <- c(0, 2, 1, 1)
dataVector <- rnl(1000, param = param)

## Let's see how well nlFit works
nlFit(dataVector)
nlFit(dataVector, plots = TRUE)
fit <- nlFit(dataVector)
par(mfrow = c(1, 2))
plot(fit, which = c(1, 3))  # See only histogram and Q-Q plot



