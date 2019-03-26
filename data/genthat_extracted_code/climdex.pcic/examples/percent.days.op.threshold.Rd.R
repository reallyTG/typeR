library(climdex.pcic)


### Name: percent.days.op.threshold
### Title: Lengths of strings of TRUE values
### Aliases: percent.days.op.threshold
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

## Compute monthly tx90p.
tx90p <- percent.days.op.threshold(ci@data$tmax, ci@dates, ci@jdays,
                                   ci@date.factors$monthly,
                                   ci@quantiles$tmax$outbase$q90,
                                   ci@quantiles$tmax$inbase$q90,
                                   ci@base.range, ">",
                                   ci@max.missing.days['monthly']) *
         ci@namasks$monthly$tmax




