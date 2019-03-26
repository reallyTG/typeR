library(forecast)


### Name: gglagplot
### Title: Time series lag ggplots
### Aliases: gglagplot gglagchull

### ** Examples


gglagplot(woolyrnq)
gglagplot(woolyrnq,seasonal=FALSE)

lungDeaths <- cbind(mdeaths, fdeaths)
gglagplot(lungDeaths, lags=2)
gglagchull(lungDeaths, lags=6)

gglagchull(woolyrnq)




