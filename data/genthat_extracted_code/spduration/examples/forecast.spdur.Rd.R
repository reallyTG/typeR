library(spduration)


### Name: forecast.spdur
### Title: Forecast from a spdur model
### Aliases: forecast.spdur

### ** Examples

library(forecast)
data(coups)
data(model.coups)

coups.dur <- add_duration(coups, "succ.coup", "gwcode", "year", freq="year")
pred.data <- coups.dur[coups.dur$year==max(coups.dur$year), ]
pred.data <- pred.data[complete.cases(pred.data), ]
fcast <- forecast(model.coups, pred.data=pred.data)




