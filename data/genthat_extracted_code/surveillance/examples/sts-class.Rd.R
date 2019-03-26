library(surveillance)


### Name: sts-class
### Title: Class '"sts"' - surveillance time series
### Aliases: sts sts-class alarms,sts-method alarms<-,sts-method
###   upperbound,sts-method upperbound<-,sts-method control,sts-method
###   control<-,sts-method epoch,sts-method epoch<-,sts-method
###   observed,sts-method observed<-,sts-method population,sts-method
###   population<-,sts-method multinomialTS,sts-method
###   multinomialTS<-,sts-method neighbourhood,sts-method
###   neighbourhood<-,sts-method dim,sts-method dimnames,sts-method
###   epochInYear epochInYear,sts-method year year,sts-method
###   initialize,sts-method as.data.frame,sts-method coerce,sts,ts-method
###   coerce,ts,sts-method as.xts.sts
### Keywords: classes

### ** Examples

## A typical dataset with weekly counts of measles from several districts
data("measlesWeserEms")
measlesWeserEms

## reconstruct data("measlesWeserEms") from its components
counts <- observed(measlesWeserEms)
map <- measlesWeserEms@map
populationFrac <- population(measlesWeserEms)
weserems_nbOrder <- neighbourhood(measlesWeserEms)
## orders of adjacency can also be determined from the map
if (requireNamespace("spdep")) {
    stopifnot(identical(weserems_nbOrder,
                        nbOrder(poly2adjmat(map), maxlag = 10)))
}
mymeasles <- sts(counts, start = c(2001, 1), frequency = 52,
                 population = populationFrac,
                 neighbourhood = weserems_nbOrder, map = map)
stopifnot(identical(mymeasles, measlesWeserEms))

## convert ts/mts object to sts
z <- ts(matrix(rpois(300,10), 100, 3), start = c(1961, 1), frequency = 12)
z.sts <- as(z, "sts")
plot(z.sts)

## conversion of "sts" objects to the quasi-standard "xts" class
if (requireNamespace("xts")) {
    z.xts <- as.xts.sts(z.sts)
    plot(z.xts)
}



