library(climdex.pcic)


### Name: climdex.tn10p
### Title: Percent of Values Below 10th Percentile Daily Minimum
###   Temperature
### Aliases: climdex.tn10p
### Keywords: climate ts

### ** Examples

library(PCICt)

## Create a climdexInput object from some data already loaded in and
## ready to go.

## Parse the dates into PCICt.
tmax.dates <- as.PCICt(do.call(paste, ec.1018935.tmax[,c("year",
"jday")]), format="%Y %j", cal="gregorian")
tmin.dates <- as.PCICt(do.call(paste, ec.1018935.tmin[,c("year",
"jday")]), format="%Y %j", cal="gregorian")
prec.dates <- as.PCICt(do.call(paste, ec.1018935.prec[,c("year",
"jday")]), format="%Y %j", cal="gregorian")

## Load the data in.
ci <- climdexInput.raw(ec.1018935.tmax$MAX_TEMP,
ec.1018935.tmin$MIN_TEMP, ec.1018935.prec$ONE_DAY_PRECIPITATION,
tmax.dates, tmin.dates, prec.dates, base.range=c(1971, 2000))

## Create a monthly timeseries of the TN10p index.
tn10p <- climdex.tn10p(ci)



