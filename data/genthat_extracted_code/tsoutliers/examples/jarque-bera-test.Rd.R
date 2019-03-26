library(tsoutliers)


### Name: JarqueBera.test
### Title: Jarque-Bera Test for Normality
### Aliases: JarqueBera.test print.mhtest
### Keywords: ts, htest

### ** Examples

# fit an ARIMA model to the HICP 011600 series
# ARIMA(0,1,0)(2,0,1) was chosen by forecast::auto.arima(ic = "bic")
# normality of the residuals is rejected at the 5% significance level
# due to an excess of kurtosis
data("hicp")
y <- log(hicp[["011600"]])
fit1 <- arima(y, order = c(0, 1, 0), seasonal = list(order = c(2, 0, 1)))
JarqueBera.test(fit1)
JarqueBera.test(residuals(fit1))

# fit ARIMA model for the same series including outliers that were
# detected by "tso" and for the model chosen by "auto.arima"
# normality of the residuals is not rejected at the 5% significance level
# after including the presence of outliers
mo <- outliers(c("AO", "AO", "LS", "LS"), c(79, 210, 85, 225))
xreg <- outliers.effects(mo, length(y))
fit2 <- arima(y, order = c(1, 1, 0), seasonal = list(order = c(2, 0, 2)), 
  xreg = xreg)
JarqueBera.test(fit2)



