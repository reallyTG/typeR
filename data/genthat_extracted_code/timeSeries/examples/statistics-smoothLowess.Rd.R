library(timeSeries)


### Name: smooth
### Title: Smoothes Time Series Objects
### Aliases: smoothLowess smoothSpline smoothSupsmu
### Keywords: chron

### ** Examples

## Use Close from MSFT's Price Series  - 
   head(MSFT)
   MSFT.CLOSE <- MSFT[, "Close"]
   head(MSFT.CLOSE)
   
## Plot Original and Smoothed Series by Lowess - 
   MSFT.LOWESS <- smoothLowess(MSFT.CLOSE, f = 0.1)
   head(MSFT.LOWESS)
   plot(MSFT.LOWESS)
   title(main = "Close - Lowess Smoothed")
   
## Plot Original and Smoothed Series by Splines - 
   MSFT.SPLINE <- smoothSpline(MSFT.CLOSE, spar = 0.4)
   head(MSFT.SPLINE)
   plot(MSFT.SPLINE)
   title(main = "Close - Spline Smoothed")
   
## Plot Original and Smoothed Series by Supsmu - 
   MSFT.SUPSMU <- smoothSupsmu(MSFT.CLOSE)
   head(MSFT.SUPSMU)
   plot(MSFT.SUPSMU)
   title(main = "Close - Spline Smoothed")



