library(GeneralizedHyperbolic)


### Name: nigPlots
### Title: Normal inverse Gaussian Quantile-Quantile and Percent-Percent
###   Plots
### Aliases: qqnig ppnig
### Keywords: hplot distribution

### ** Examples

par(mfrow = c(1, 2))
param <- c(2, 2, 2, 1.5)
y <- rnig(200, param = param)
qqnig(y, param = param, line = FALSE)
abline(0, 1, col = 2)
ppnig(y, param = param)



