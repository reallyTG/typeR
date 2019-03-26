library(rmaf)


### Name: ss.filter
### Title: Smoothing Spline Filter.
### Aliases: ss.filter

### ** Examples

## decompose the trend for the first difference of annual global air temperature from 1880-1985
data(globtemp)
decomp1 <- ss.filter(globtemp)

## decompose the trend and seasonality for CO2 data with monthly and additive seasonality
decomp2 <- ss.filter(co2, seasonal = TRUE, period = 12)

## decompose the trend and seasonality for monthly airline passenger numbers from 1949-1960
decomp3 <- ss.filter(AirPassengers, seasonal = TRUE, period = 12)

## simulation data: oracally efficient estimation for AR(p) coefficients
d <- 12
n <- d*100
x <- (1:n)/n
y <- 1 + 2*x + 0.3*x^2 + sin(pi*x/6) + arima.sim(n = n,list(ar = 0.2), sd = 1)
fit <- ss.filter(y, seasonal = TRUE,period = 12, plot = FALSE)
ar(fit[,4], aic = FALSE, order.max = 1)$ar



