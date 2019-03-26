library(M3)


### Name: project.lonlat.to.M3
### Title: Project coordinates from longitude/latitude to model units.
### Aliases: project.lonlat.to.M3

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

## Put these on a new plot.
dev.new()
plot(lcc.capitals$coords)
## Project state lines to this projection.
lcc.map <- get.map.lines.M3.proj(lcc.file)
lines(lcc.map$coords)



