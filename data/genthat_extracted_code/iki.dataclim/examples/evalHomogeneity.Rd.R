library(iki.dataclim)


### Name: evalHomogeneity
### Title: Quality labels for temperature and precipitation observation
###   series
### Aliases: evalHomogeneity
### Keywords: htest

### ** Examples

data(potsdam)
date <- as.Date(potsdam$date)
myDataclim <- createDataclim(date=date, tmin=potsdam$tmin, tmax=potsdam$tmax,
                          prec=potsdam$prec, basePeriod=1981:2010)
evalHomogeneity(myDataclim)



