library(ParetoPosStable)


### Name: GoF
### Title: Goodness of fit tests for the Pareto Positive Stable (PPS)
###   distribution
### Aliases: GoF GoF.default

### ** Examples

x <- rPPS(50, 1.2, 100, 2.3)
fit <- PPS.fit(x)
GoF(fit, k = 50)



