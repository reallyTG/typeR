library(sarima)
context("Fitting Sarima models with estimated unit roots")

## the air plane model (1-B)(1-B^12) + MA(1) + SMA(12, 1)
sarima(log(AirPassengers) ~ 0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) + 
              i(1) + si(12,1), ss.method = "sarima")

## two ways to estimate the parameters of the unit root operator 
## to see if the result is similar (it is)
sarima(log(AirPassengers) ~ 0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) + 
              uar(13, c(rep(0,12), 1), fixed = 13, atanh.tr = TRUE), ss.method = "sarima")

sarima(log(AirPassengers) ~ 0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) + 
              i(2) + uar(11, c(rep(0,10), 1), fixed = 11), ss.method = "sarima")
