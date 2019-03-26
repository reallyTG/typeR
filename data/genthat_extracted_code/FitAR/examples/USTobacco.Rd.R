library(FitAR)


### Name: USTobacco
### Title: U.S. Tobacco Production, 1871-1984
### Aliases: USTobacco
### Keywords: datasets

### ** Examples

#From a plot of the series, we see that the variance is increasing with level.
#From the acf of the first differences an ARIMA(0,1,1) is suggested.
 data(USTobacco)
# layout(matrix(c(1,2,1,2),ncol=2))
 plot(USTobacco)
 lines(lowess(time(USTobacco), USTobacco), lwd=2, col="blue")
 acf(diff(USTobacco, differences=1))




