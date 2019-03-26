library(iki.dataclim)


### Name: computeClimdex
### Title: Compute a comprehensive set of climdex indices
### Aliases: computeClimdex
### Keywords: univar

### ** Examples

data(potsdam)
date <- as.Date(potsdam$date)
myDataclim <- createDataclim(date=date, tmin=potsdam$tmin, tmax=potsdam$tmax,
                          prec=potsdam$prec, basePeriod=1981:2010)
myClimdex <- createClimdex(myDataclim, basePeriod=1981:2010)
climdexIndices <- computeClimdex(myClimdex)



