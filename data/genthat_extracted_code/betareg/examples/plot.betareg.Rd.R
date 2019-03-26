library(betareg)


### Name: plot.betareg
### Title: Diagnostic Plots for betareg Objects
### Aliases: plot.betareg
### Keywords: regression

### ** Examples

data("GasolineYield", package = "betareg")

gy <- betareg(yield ~ gravity + pressure + temp10 + temp, data = GasolineYield)

par(mfrow = c(3, 2))
plot(gy, which = 1:6)
par(mfrow = c(1, 1))



