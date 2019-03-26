library(arfima)


### Name: arfima
### Title: Fit ARFIMA, ARIMA-FGN, and ARIMA-PLA (multi-start) models Fits
###   ARFIMA/ARIMA-FGN/ARIMA-PLA multi-start models to times series data.
###   Options include fixing parameters, whether or not to fit fractional
###   noise, what type of fractional noise (fractional Gaussian noise
###   (FGN), fractionally differenced white noise (FDWN), or the newly
###   introduced power-law autocovariance noise (PLA)), etc.  This function
###   can fit regressions with ARFIMA/ARIMA-FGN/ARIMA-PLA errors via the
###   xreg argument, including dynamic regression (transfer functions).
### Aliases: arfima
### Keywords: ts

### ** Examples


## No test: 
set.seed(8564)
sim <- arfima.sim(1000, model = list(phi = c(0.2, 0.1),
dfrac = 0.4, theta = 0.9))
fit <- arfima(sim, order = c(2, 0, 1), back=TRUE)

fit

data(tmpyr)

fit <- arfima(tmpyr, order = c(1, 0, 1), numeach = c(3, 3))
fit

plot(tacvf(fit), maxlag = 30, tacf = TRUE)

data(SeriesJ)
attach(SeriesJ)

fitTF <- arfima(YJ, order= c(2, 0, 0), xreg = XJ, reglist =
list(regpar = c(2, 2, 3)), lmodel = "n")
fitTF

detach(SeriesJ)

## End(No test)




