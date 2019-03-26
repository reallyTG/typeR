library(forecast)


### Name: tsCV
### Title: Time series cross-validation
### Aliases: tsCV
### Keywords: ts

### ** Examples


#Fit an AR(2) model to each rolling origin subset
far2 <- function(x, h){forecast(Arima(x, order=c(2,0,0)), h=h)}
e <- tsCV(lynx, far2, h=1)

#Fit the same model with a rolling window of length 30
e <- tsCV(lynx, far2, h=1, window=30)




