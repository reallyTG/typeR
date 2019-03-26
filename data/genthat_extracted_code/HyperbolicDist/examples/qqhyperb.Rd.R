library(HyperbolicDist)


### Name: HyperbPlots
### Title: Hyperbolic Quantile-Quantile and Percent-Percent Plots
### Aliases: qqhyperb pphyperb
### Keywords: hplot distribution

### ** Examples

par(mfrow = c(1,2))
y <- rhyperb(200, c(2,2,2,2))
qqhyperb(y, c(2,2,2,2),line = FALSE)
abline(0, 1, col = 2)
pphyperb(y, c(2,2,2,2))



