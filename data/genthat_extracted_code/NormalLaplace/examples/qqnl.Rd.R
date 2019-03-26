library(NormalLaplace)


### Name: nlPlots
### Title: Normal Laplace Quantile-Quantile and Percent-Percent Plots
### Aliases: qqnl ppnl
### Keywords: nlplot distribution

### ** Examples

par(mfrow = c(1, 2))
param <- c(2, 2, 1, 1)
y <- rnl(200, param = param)
qqnl(y, param = param, line = FALSE)
abline(0, 1, col = 2)
ppnl(y, param = param)



