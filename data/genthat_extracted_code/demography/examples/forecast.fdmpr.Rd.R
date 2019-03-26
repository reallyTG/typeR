library(demography)


### Name: forecast.fdmpr
### Title: Forecast coherent functional demographic model.
### Aliases: forecast.fdmpr
### Keywords: models

### ** Examples

fr.short <- extract.years(fr.sm,1950:2006)
fr.fit <- coherentfdm(fr.short)
fr.fcast <- forecast(fr.fit)
plot(fr.fcast$male)
plot(fr.fcast$ratio$male, plot.type='component', components=3)
models(fr.fcast)



