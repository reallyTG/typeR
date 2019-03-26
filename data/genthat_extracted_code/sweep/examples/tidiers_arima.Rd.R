library(sweep)


### Name: tidiers_arima
### Title: Tidying methods for ARIMA modeling of time series
### Aliases: tidiers_arima sw_tidy.Arima sw_glance.Arima sw_augment.Arima

### ** Examples

library(forecast)
library(sweep)

fit_arima <- WWWusage %>%
    auto.arima()

sw_tidy(fit_arima)
sw_glance(fit_arima)
sw_augment(fit_arima)





