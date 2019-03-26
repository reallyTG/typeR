## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
options(tibble.print_min = 4L, tibble.print_max = 4L)
library(prophet)
library(dplyr)

## ---- results= "hide"----------------------------------------------------
library(readr)
df <- read_csv('../tests/testthat/data.csv')

## ------------------------------------------------------------------------
m <- prophet(df)

## ------------------------------------------------------------------------
future <- make_future_dataframe(m, periods = 365)
head(future)

## ------------------------------------------------------------------------
forecast <- predict(m, future)
head(forecast)

## ------------------------------------------------------------------------
plot(m, forecast)

## ------------------------------------------------------------------------
prophet_plot_components(m, forecast)

