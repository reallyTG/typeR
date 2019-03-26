library(wql)


### Name: plotSeason
### Title: Plots seasonal patterns for a time series
### Aliases: plotSeason
### Keywords: Graphics ts

### ** Examples


chl27 <- sfbayChla[, 's27']
plotSeason(chl27, num.era = c(1978, 1988, 1998, 2008), ylab = 'Stn 27 Chl-a')
plotSeason(chl27, num.era = 3, same.plot = FALSE, ylab = 'Stn 27 Chl-a')
plotSeason(chl27, "by.month", ylab = 'Stn 27 Chl-a')




