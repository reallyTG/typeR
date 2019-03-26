library(forecast)


### Name: forecast.stl
### Title: Forecasting using stl objects
### Aliases: forecast.stl stlm forecast.stlm stlf
### Keywords: ts

### ** Examples


tsmod <- stlm(USAccDeaths, modelfunction=ar)
plot(forecast(tsmod, h=36))

decomp <- stl(USAccDeaths,s.window="periodic")
plot(forecast(decomp))


plot(stlf(AirPassengers, lambda=0))




