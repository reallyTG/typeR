library(climdex.pcic)


### Name: number.days.op.threshold
### Title: Number of days (less than, greater than, etc) a threshold
### Aliases: number.days.op.threshold
### Keywords: climate ts

### ** Examples

library(PCICt)

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

## Calculate frost days.
fd <- number.days.op.threshold(ci@data$tmin,
                               ci@date.factors$annual, 0, "<")




