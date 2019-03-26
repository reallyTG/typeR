library(SpatialEpi)


### Name: NYleukemia
### Title: Upstate New York Leukemia Data
### Aliases: NYleukemia
### Keywords: datasets

### ** Examples

## Load data and convert coordinate system from latitude/longitude to grid
data(NYleukemia)
map <- NYleukemia$spatial.polygon
population <- NYleukemia$data$population
cases <- NYleukemia$data$cases
centroids <- latlong2grid(NYleukemia$geo[, 2:3])

## Identify the 4 census tract to be merged into their surrounding census tracts.  
remove <- NYleukemia$surrounded
add <- NYleukemia$surrounding

## Merge population and case counts
population[add] <- population[add] + population[remove]
population <- population[-remove]
cases[add] <- cases[add] + cases[remove]
cases <- cases[-remove]

## Modify geographical objects accordingly
map <- SpatialPolygons(map@polygons[-remove], proj4string=CRS("+proj=longlat +ellps=WGS84"))
centroids <- centroids[-remove, ]

## Plot incidence in latitude/longitude
plotmap(cases/population, map, log=TRUE, nclr=5)
points(grid2latlong(centroids), pch=4)



