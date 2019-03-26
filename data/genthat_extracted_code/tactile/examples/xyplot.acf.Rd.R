library(tactile)


### Name: xyplot.acf
### Title: Plot Autocovariance and Autocorrelation Functions
### Aliases: xyplot.acf

### ** Examples

z <- ts(matrix(rnorm(400), 100, 4), start = c(1961, 1), frequency = 12)
xyplot(acf(z))



