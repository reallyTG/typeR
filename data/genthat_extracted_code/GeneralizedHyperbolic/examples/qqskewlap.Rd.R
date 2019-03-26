library(GeneralizedHyperbolic)


### Name: SkewLaplacePlots
### Title: Skew-Laplace Quantile-Quantile and Percent-Percent Plots
### Aliases: qqskewlap ppskewlap
### Keywords: hplot distribution

### ** Examples

par(mfrow = c(1, 2))
y <- rskewlap(1000, param = c(2, 0.5, 1))
qqskewlap(y, param = c(2, 0.5, 1), line = FALSE)
abline(0, 1, col = 2)
ppskewlap(y, param = c(2, 0.5, 1))



