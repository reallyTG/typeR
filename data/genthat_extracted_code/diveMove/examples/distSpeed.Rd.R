library(diveMove)


### Name: distSpeed
### Title: Calculate distance and speed between locations
### Aliases: distSpeed
### Keywords: math manip

### ** Examples


## Using the Example from '?readLocs':
utils::example("readLocs", package="diveMove",
               ask=FALSE, echo=FALSE)

## Travel summary between successive standard locations
locs.std <- subset(locs, subset=class == "0" | class == "1" |
                   class == "2" | class == "3" &
                   !is.na(lon) & !is.na(lat))
## Default Meeus method
locs.std.tr <- by(locs.std, locs.std$id, function(x) {
    distSpeed(x[-nrow(x), 3:5], x[-1, 3:5])
})
lapply(locs.std.tr, head)

## Particular quantiles from travel summaries
lapply(locs.std.tr, function(x) {
    quantile(x[, 3], seq(0.90, 0.99, 0.01), na.rm=TRUE) # speed
})
lapply(locs.std.tr, function(x) {
    quantile(x[, 1], seq(0.90, 0.99, 0.01), na.rm=TRUE) # distance
})

## Travel summary between two arbitrary sets of points
pts <- seq(10)
(meeus <- distSpeed(locs[pts, 3:5], locs[pts + 1, 3:5]))
(vincenty <- distSpeed(locs[pts, 3:5],
                       locs[pts + 1, 3:5],
                       method="VincentyEllipsoid"))
meeus - vincenty




