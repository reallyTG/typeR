library(maptools)


### Name: gzAzimuth
### Title: Find azimuth for geographical coordinates
### Aliases: gzAzimuth trackAzimuth
### Keywords: spatial

### ** Examples

name <- c("Mecca", "Anchorage", "Washington")
long <- c(39.823333, -149.883333, -77.0166667)
lat <- c(21.423333, 61.2166667, 38.9)
x <- cbind(long, lat)
row.names(x) <- name
crib <- c(-9.098363, 56.575960)
r1 <- gzAzimuth(x[2:3,], x[1,])
r1
all.equal(r1, crib)
r2 <- gzAzimuth(x[2:3,], x[1,], type="abdali")
r2
all.equal(r2, crib)
trackAzimuth(x)



