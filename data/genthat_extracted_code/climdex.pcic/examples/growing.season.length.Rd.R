library(climdex.pcic)


### Name: growing.season.length
### Title: Flexible GSL function
### Aliases: growing.season.length
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

## Create an annual timeseries of the growing season length in days.
gsl <- growing.season.length(ci@data$tavg, ci@date.factors$annual, ci@dates,
                             ci@northern.hemisphere, gsl.mode="GSL") * 
       ci@namasks$annual$tavg

## Print these out for testing purposes.
gsl




