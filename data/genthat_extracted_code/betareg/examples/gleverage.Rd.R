library(betareg)


### Name: gleverage
### Title: Generalized Leverage Values
### Aliases: gleverage gleverage.betareg
### Keywords: regression

### ** Examples

options(digits = 4)
data("GasolineYield", package = "betareg")
gy <- betareg(yield ~ batch + temp, data = GasolineYield)
gleverage(gy)



