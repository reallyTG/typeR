library(forecast)


### Name: autolayer.mts
### Title: Automatically create a ggplot for time series objects
### Aliases: autolayer.mts autolayer.msts autolayer.ts autoplot.ts
###   autoplot.mts autoplot.msts fortify.ts

### ** Examples


library(ggplot2)
autoplot(USAccDeaths)

lungDeaths <- cbind(mdeaths, fdeaths)
autoplot(lungDeaths)
autoplot(lungDeaths, facets=TRUE)




