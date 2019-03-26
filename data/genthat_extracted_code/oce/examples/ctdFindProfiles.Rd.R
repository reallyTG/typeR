library(oce)


### Name: ctdFindProfiles
### Title: Find Profiles within a Tow-Yow CTD Record
### Aliases: ctdFindProfiles

### ** Examples

## Not run: 
##D library(oce)
##D ## Example 1.
##D d <- read.csv("towyow.csv", header=TRUE)
##D towyow <- as.ctd(d$salinity, d$temperature, d$pressure)
##D 
##D casts <- ctdFindProfiles(towyow)
##D par(mfrow=c(length(casts), 3))
##D for (cast in casts) {
##D   plotProfile(cast, "salinity")
##D   plotProfile(cast, "temperature")
##D   plotTS(cast, type='o')
##D }
##D 
##D ## Example 2.
##D ## Using a moving average to smooth pressure, instead of the default
##D ## smooth.spline() method. This avoids a tendency of smooth.spline()
##D ## to smooth out the profiles in a tow-yo with many (dozens or more) cycles.
##D movingAverage <- function(x, n = 11, ...)
##D {
##D    f <- rep(1/n, n)
##D    stats::filter(x, f, ...)
##D }
##D casts <- ctdFindProfiles(towyo, smoother=movingAverage)
##D 
##D ## Example 3: glider data, with profiles separated by >10dbar jump.
##D breaks <- which(diff(ctd[["pressure"]]) > 10))
##D profiles <- ctdFindProfiles(ctd, breaks=breaks)
## End(Not run)




