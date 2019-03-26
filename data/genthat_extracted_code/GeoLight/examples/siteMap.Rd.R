library(GeoLight)


### Name: siteMap
### Title: Draws sites of residency and adds a convex hull
### Aliases: siteMap

### ** Examples

data(hoopoe2)
 hoopoe2$tFirst <- as.POSIXct(hoopoe2$tFirst, tz = "GMT")
 hoopoe2$tSecond <- as.POSIXct(hoopoe2$tSecond, tz = "GMT")
crds <- coord(hoopoe2, degElevation = -6)
filter <- distanceFilter(hoopoe2, distance = 30)
site <- changeLight(hoopoe2, rise.prob = 0.1, set.prob = 0.1, plot = FALSE,
 summary = FALSE)$site
siteMap(crds[filter,], site[filter], xlim=c(-20,20), ylim=c(0,60),
 lwd=2, pch=20, cex=0.5, main="hoopoe2")



