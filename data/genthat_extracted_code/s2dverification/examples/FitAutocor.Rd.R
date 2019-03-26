library(s2dverification)


### Name: FitAutocor
### Title: Fits an AR1 Autocorrelation Function Using Dichotomy
### Aliases: FitAutocor
### Keywords: datagen

### ** Examples

series <- GenSeries(1000, 0.35, 2, 1)
estacf <- acf(series[951:1000], plot = FALSE)$acf
alpha <-  FitAutocor(estacf, c(-1, 1), 0.01)
print(alpha)



