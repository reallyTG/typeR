library(M3)


### Name: get.canusamex.bds
### Title: Obtain map boundaries for Canada, USA, and Mexico
### Aliases: get.canusamex.bds

### ** Examples

## Set up a plotting region (in longitude/latitude) that includes an
## eastern portion of the Canada/USA border.
plot(c(-82,-67), c(39,49), type="n", xlab="Longitude", ylab="Latitude")
## Superimpose national boundaries from "world" database, which is
## fairly low-resolution (since it includes worldwide national boundaries).
map("world", regions="canada", add=TRUE)
## Now, if we try to superimpose the the USA state boundaries from the
## higher resolution "state" database, we have a conflict.  (See
## particularly the Maine border.)
map("state", add=TRUE, col="blue")
## The high-resolution national boundaries in database "worldHires" (in
## mapdata) also don't match up with the state lines.
map("worldHires", add=TRUE, col="magenta")

## Instead, we get the national boundaries (Canada, USA, Mexico) at
## high-resolution from database "worldHires" and the state boundaries
## (without the coastlines and national boundaries) from the "state"
## database.
dev.new()
plot(c(-82,-67), c(39,49), type="n", xlab="Longitude", ylab="Latitude")
lines(get.canusamex.bds())



