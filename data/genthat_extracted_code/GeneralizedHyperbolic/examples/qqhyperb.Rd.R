library(GeneralizedHyperbolic)


### Name: HyperbPlots
### Title: Hyperbolic Quantile-Quantile and Percent-Percent Plots
### Aliases: qqhyperb pphyperb
### Keywords: hplot distribution

### ** Examples

par(mfrow = c(1, 2))
param <- c(2, 2, 2, 1.5)
y <- rhyperb(200, param = param)
qqhyperb(y, param = param, line = FALSE)
abline(0, 1, col = 2)
pphyperb(y, param = param)



