library(GeneralizedHyperbolic)


### Name: GIGPlots
### Title: Generalized Inverse Gaussian Quantile-Quantile and
###   Percent-Percent Plots
### Aliases: qqgig ppgig
### Keywords: hplot distribution

### ** Examples

par(mfrow = c(1, 2))
y <- rgig(1000, param = c(2, 3, 1))
qqgig(y, param = c(2, 3, 1), line = FALSE)
abline(0, 1, col = 2)
ppgig(y, param = c(2, 3, 1))



