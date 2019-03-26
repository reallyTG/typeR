library(M3)


### Name: project.M3.to.lonlat
### Title: Project coordinates from model units to longitude/latitude
### Aliases: project.M3.to.lonlat

### ** Examples

## List of state capital longitudes/latitudes
## (from http://www.xfront.com/us_states).
capitals <- data.frame(x=c(-84.39,-86.28,-81.04,-86.78,-78.64,-84.86),
                       y=c(33.76,32.36,34.00,36.17,35.77,38.20),
                       name=c("Atlanta", "Montgomery", "Columbia",
                                 "Nashville", "Raleigh", "Frankfort")
                        )
## Plot these on a map, with state lines.
plot(capitals$x, capitals$y)
map("state", add=TRUE)

## Now, put these on the same Lambert conic conformal projection used
## in the demo file below.
lcc.file <- system.file("extdata/ozone_lcc.ncf", package="M3")
lcc.capitals <- project.lonlat.to.M3(capitals$x, capitals$y, lcc.file)

## Now, project them back to longitude/latitude, make sure we get the
## same thing we started with.
chk.capitals <- project.M3.to.lonlat(lcc.capitals$coords[,"x"],
                                     lcc.capitals$coords[,"y"],
                                     lcc.file,
                                     units=lcc.capitals$units)
## These differences should be 0 or something very tiny.
summary(capitals[,c("x", "y")] - chk.capitals$coords)



