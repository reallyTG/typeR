library(iki.dataclim)


### Name: createDataclim
### Title: Create a 'dataclim' object
### Aliases: createDataclim
### Keywords: class

### ** Examples
 
data(potsdam)
date <- as.Date(potsdam$date)
myDataclim <- createDataclim(date=date, tmin=potsdam$tmin, tmax=potsdam$tmax,
                          prec=potsdam$prec, basePeriod=1981:2010)



