library(demography)


### Name: forecast.fdm
### Title: Forecast functional demographic model.
### Aliases: forecast.fdm
### Keywords: models

### ** Examples

france.fit <- fdm(fr.mort,order=2)
france.fcast <- forecast(france.fit,50)
plot(france.fcast)
models(france.fcast)



