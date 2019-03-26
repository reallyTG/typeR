library(iki.dataclim)


### Name: plotWalterLieth
### Title: Plot a Walter Lieth climate diagram
### Aliases: plotWalterLieth
### Keywords: plot

### ** Examples

data(potsdam)
date <- as.Date(potsdam$date)
myDataclim <- createDataclim(date=date, tmin=potsdam$tmin, tmax=potsdam$tmax,
                          prec=potsdam$prec, basePeriod=1981:2010)
plotWalterLieth(myDataclim)
plotWalterLieth(myDataclim, station="Potsdam", alt=80)



