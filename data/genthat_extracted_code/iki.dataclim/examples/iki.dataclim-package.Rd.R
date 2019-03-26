library(iki.dataclim)


### Name: iki.dataclim-package
### Title: Consistency, homogeneity, summary statistics and indices of
###   climate data
### Aliases: iki.dataclim-package
### Keywords: package

### ** Examples

## A typical work flow could be:

## load the package
library(iki.dataclim)

## load example data and create vector of class Date
data(potsdam)
date <- as.Date(potsdam$date)

## create a dataclim object
myDataclim <- createDataclim(date=date, tmin=potsdam$tmin, tmax=potsdam$tmax,
                          prec=potsdam$prec, basePeriod=1981:2010)

## look at the days with quality issues
slot(myDataclim, "flaggedData")

## evaluate homogeneity of temperature and precipitation
evalHomogeneity(myDataclim)

## look at summary climate statistics for the period 1980-2000
summary(myDataclim, 1980:2000)

## create a Walter-Lieth climate diagram
plotWalterLieth(myDataclim)

## convert the dataclim object to a climdexInput object (from package
## climdex.pcic) and compute a comprehensive set of ETCCDI climate
## indices
myClimdex <- createClimdex(myDataclim, basePeriod=1981:2010)
climdexIndices <- computeClimdex(myClimdex)

## plot the annual timeseries of maximum daily maximum temperature
plot(climdexIndices$annual[, "txx"])



