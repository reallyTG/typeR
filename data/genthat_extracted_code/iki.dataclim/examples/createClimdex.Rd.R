library(iki.dataclim)


### Name: createClimdex
### Title: Create a climdex.pcic::climdexInput from a 'dataclim' object
### Aliases: createClimdex
### Keywords: manip

### ** Examples

data(potsdam)
date <- as.Date(potsdam$date)
myDataclim <- createDataclim(date=date, tmin=potsdam$tmin, tmax=potsdam$tmax,
                          prec=potsdam$prec, basePeriod=1981:2010)
myClimdex <- createClimdex(myDataclim, 1981:2010)



