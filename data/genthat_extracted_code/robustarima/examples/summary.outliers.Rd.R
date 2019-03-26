library(robustarima)


### Name: summary.outliers
### Title: Summary Method for outliers Objects
### Aliases: summary.outliers
### Keywords: ts

### ** Examples

frip.rr <- arima.rob(log(frip.dat) ~ 1, p=2, d=1)
frip.outliers <- outliers(frip.rr)
summary(frip.outliers)



