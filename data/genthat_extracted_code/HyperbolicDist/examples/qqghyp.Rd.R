library(HyperbolicDist)


### Name: GeneralizedHyperbolicPlots
### Title: Generalized Hyperbolic Quantile-Quantile and Percent-Percent
###   Plots
### Aliases: qqghyp ppghyp
### Keywords: hplot distribution

### ** Examples

par(mfrow = c(1,2))
y <- rghyp(200, c(2,2,1,2,2))
qqghyp(y, c(2,2,1,2,2),line = FALSE)
abline(0, 1, col = 2)
ppghyp(y, c(2,2,1,2,2))



