library(robustarima)


### Name: outliers
### Title: Outliers Extraction for an <code>arima.rob</code> Object
### Aliases: outliers
### Keywords: ts

### ** Examples

frip.rr <- arima.rob(log(frip.dat) ~ 1, p=2, d=1, iter=2)
frip.outliers.all <- outliers(frip.rr)
frip.outliers.2 <- outliers(frip.rr, iter=2)



