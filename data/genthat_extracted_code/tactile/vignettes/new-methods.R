## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 4,
  fig.height = 3.2
)

## ------------------------------------------------------------------------
fit <- lm(Sepal.Length ~ Sepal.Width, data = iris)

## ---- fig.cap = "Plot diagnostics with `stats::plot.lm()`.", fig.width = 6, fig.height = 9.5----
par(mfrow = c(3, 2), cex = 1)
plot(fit, which = 1:6)
par(mfrow = c(1, 1))

## ---- fig.cap = "Plot diagnostics with `xyplot.lm()`.", fig.width = 6, fig.height = 9.5----
library(tactile)
xyplot(fit, which = 1:6)

## ---- fig.height = 6, fig.width = 4--------------------------------------
fit <- arima(lh, c(0, 0, 1))
tsdiag(fit)

## ---- fig.width = 7, fig.height = 5--------------------------------------
xyplot(fit)

## ------------------------------------------------------------------------
library(forecast)
train <- window(USAccDeaths, c(1973, 1), c(1977, 12))
test <- window(USAccDeaths, c(1978, 1), c(1978, 12))

## ---- fig.width = 6, fig.height = 3--------------------------------------
fit <- arima(train, order = c(0, 1, 1), seasonal = list(order = c(0, 1, 1)))
fcast1 <- forecast(fit, 12)
xyplot(fcast1, test, grid = TRUE, auto.key = list(corner = c(0, 0.99)),
       ci_key = list(title = "PI Level"))

## ---- fig.width = 6, fig.height = 3--------------------------------------
# A fan plot
fcast2 <- forecast(fit, 12, level = seq(0, 95, 10))
xyplot(fcast2, test, ci_pal = heat.colors(100))

