library(demography)


### Name: forecast.lca
### Title: Forecast demogdata data using Lee-Carter method.
### Aliases: forecast.lca
### Keywords: models

### ** Examples

france.lca <- lca(fr.mort, adjust="e0")
france.fcast <- forecast(france.lca, 50)
plot(france.fcast)
plot(france.fcast,'c')



