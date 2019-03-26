library(wql)


### Name: interpTs
### Title: Interpolate or substitute missing time series values
### Aliases: interpTs
### Keywords: manip utilities

### ** Examples


### Interpolate a vector time series and highlight the imputed data
chl27 <- sfbayChla[, 's27']
x1 <- interpTs(chl27, gap = 3)
plot(x1, col = 'red')
lines(chl27, col = 'blue')
x2 <- interpTs(chl27, type = "series.median", gap = 3)
plot(x2, col = 'red')
lines(chl27, col = 'blue')

### Interpolate a matrix time series and plot results
x3 <- interpTs(sfbayChla, type = "cycle.mean", gap = 1)
plot(x3[, 1:10], main = "SF Bay Chl-a\n(gaps of 1 month replaced)")




