library(forecast)


### Name: fourier
### Title: Fourier terms for modelling seasonality
### Aliases: fourier fourierf
### Keywords: ts

### ** Examples


library(ggplot2)

# Using Fourier series for a "ts" object
# K is chosen to minimize the AICc
deaths.model  <- auto.arima(USAccDeaths, xreg=fourier(USAccDeaths,K=5), seasonal=FALSE)
deaths.fcast <- forecast(deaths.model, xreg=fourier(USAccDeaths, K=5, h=36))
autoplot(deaths.fcast) + xlab("Year")

# Using Fourier series for a "msts" object
taylor.lm <- tslm(taylor ~ fourier(taylor, K = c(3, 3)))
taylor.fcast <- forecast(taylor.lm,
    data.frame(fourier(taylor, K = c(3, 3), h = 270)))
autoplot(taylor.fcast)




