## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
set.seed(5)
x1 = 1:96/20 + ts(rnorm(96, 100, 1), start=c(2015,1), frequency=12)
x2 = 1:96/20 + ts(rnorm(96, 100, 1) + ts(sin((2*pi*rep(1:12, 8))/12), frequency=12), start=c(2015,1), frequency=12)

ts.plot(x1,x2, col=c("darkblue", "darkred"), main="Some simple seasonal series")
legend("topleft", c("Non seasonal series", "Seasonal series"), col=c("darkblue", "darkred"), lty=1)


## ------------------------------------------------------------------------
library(seastests)
print("Testing the non-seasonal series")
summary(wo(x1))
print("")
print("Testing the seasonal series")
summary(wo(x2))

## ------------------------------------------------------------------------
print("Test using the non-seasonal series")
isSeasonal(x1)
print("Test using the seasonal series")
isSeasonal(x2)

## ------------------------------------------------------------------------
if (!require("forecast")) install.packages("forecast")

mod1 <- auto.arima(x1, seasonal=isSeasonal(x1))
summary(mod1)
plot(forecast(mod1, h=12))


## ------------------------------------------------------------------------
mod2 <- auto.arima(x2, seasonal=isSeasonal(x2))
summary(mod2)
plot(forecast(mod2, h=12))


