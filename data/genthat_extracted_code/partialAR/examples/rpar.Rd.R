library(partialAR)


### Name: rpar
### Title: Random partially autoregressive sequence
### Aliases: rpar
### Keywords: ts models

### ** Examples

set.seed(1)
x <- rpar(10000, 0.5, 2, 1)
library(tseries)
adf.test(x)      # Seems to contain a unit root, as expected
estimate.par(x)  # Estimate parameters using lagged variances
fit.par(x)       # Maximum likelihood estimate



