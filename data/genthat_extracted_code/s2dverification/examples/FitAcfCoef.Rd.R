library(s2dverification)


### Name: FitAcfCoef
### Title: Fits an AR1 AutoCorrelation Function Using the Cardano Formula
### Aliases: FitAcfCoef
### Keywords: datagen

### ** Examples

series <- GenSeries(1000, 0.35, 2, 1)
estacf <- acf(series[951:1000], plot = FALSE)$acf
alpha <- FitAcfCoef(max(estacf[2], 0), max(estacf[3], 0))
print(alpha)



