## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(warning = FALSE, message = FALSE)


## ------------------------------------------------------------------------
library(tsfknn)
pred <- knn_forecasting(ts(1:8), h = 1, lags = 1:2, k = 2)
knn_examples(pred)

## ------------------------------------------------------------------------
pred$prediction
plot(pred)

## ------------------------------------------------------------------------
nearest_neighbors(pred)

## ------------------------------------------------------------------------
library(ggplot2)
autoplot(pred, highlight = "neighbors")

## ------------------------------------------------------------------------
pred <- knn_forecasting(USAccDeaths, h = 12, lags = 1:12, k = 2, msas = "MIMO")
autoplot(pred, highlight = "neighbors", faceting = FALSE)

## ------------------------------------------------------------------------
timeS <- window(UKgas, start = c(1976, 1))
pred <- knn_forecasting(timeS, h = 2, lags = 1:4, k = 2, msas = "recursive")
autoplot(pred, highlight = "neighbors")

## ------------------------------------------------------------------------
pred <- knn_forecasting(ldeaths, h = 12, lags = 1:12, k = c(2, 4))
pred$prediction
plot(pred)

