library(demography)


### Name: plot.lifetable
### Title: Plot life expectancy from lifetable
### Aliases: plot.lifetable lines.lifetable
### Keywords: models

### ** Examples

france.lt <- lifetable(fr.mort)
plot(france.lt)

france.LC <- lca(fr.mort)
france.fcast <- forecast(france.LC)
france.lt.f <- lifetable(france.fcast)
plot(france.lt.f,years=2010)



