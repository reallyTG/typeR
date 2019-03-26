library(surveillance)


### Name: epidataCS_aggregate
### Title: Conversion (aggregation) of '"epidataCS"' to '"epidata"' or
###   '"sts"'
### Aliases: epidataCS2sts as.epidata.epidataCS
### Keywords: spatial manip methods

### ** Examples

data("imdepi")
load(system.file("shapes", "districtsD.RData", package="surveillance"))

## convert imdepi point pattern into multivariate time series
imdsts <- epidataCS2sts(imdepi, freq = 12, start = c(2002, 1),
                        neighbourhood = NULL, # not needed here
                        tiles = districtsD)

## check the overall number of events by district
stopifnot(all.equal(colSums(observed(imdsts)),
                    c(table(imdepi$events$tile))))

## compare plots of monthly number of cases
opar <- par(mfrow = c(2, 1))
plot(imdepi, "time")
plot(imdsts, type = observed ~ time)
par(opar)

## plot number of cases by district
plot(imdsts, type = observed ~ unit)


## also test conversion to an SIS event history ("epidata") of the "tiles"
if (requireNamespace("intervals")) {
    imdepi_short <- subset(imdepi, time < 50)  # to reduce the runtime
    imdepi_short$stgrid <- subset(imdepi_short$stgrid, start < 50)
    imdepidata <- as.epidata(imdepi_short,
                             tileCentroids = coordinates(districtsD))
    summary(imdepidata)
}



