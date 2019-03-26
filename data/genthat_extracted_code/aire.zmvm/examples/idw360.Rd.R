library(aire.zmvm)


### Name: idw360
### Title: Inverse Distance Weighting with Directional Data
### Aliases: idw360

### ** Examples

library("sp")
library("ggplot2")

## Could be wind direction values in degrees
values <- c(55, 355)

## Location of sensors. First column x/longitud, second y/latitude
locations <- data.frame(lon = c(1, 2), lat = c(1, 2))
coordinates(locations) <- ~lon+lat

## The grid for which to extrapolate values
grid <- data.frame(lon = c(1, 2, 1, 2), lat = c(1, 2, 2, 1))
coordinates(grid) <- ~lon+lat

## Perform the inverse distance weighted interpolation
res <- idw360(values, locations, grid)
head(res)

df <- cbind(res, as.data.frame(grid))
## The wind direction compass starts where the 90 degree mark is located
ggplot(df, aes(lon, lat)) +
  geom_point() +
  geom_spoke(aes(angle = ((90 - pred) %% 360) * pi / 180),
             radius = 1,
             arrow=arrow(length = unit(0.2,"cm")))
## Not run: 
##D library("mapproj")
##D ## Random values in each of the measuring stations
##D locations <- stations[, c("lon", "lat")]
##D coordinates(locations) <- ~lon+lat
##D crs_string <- "+proj=longlat +ellps=WGS84 +no_defs +towgs84=0,0,0"
##D proj4string(locations) <- CRS(crs_string)
##D values <- runif(length(locations), 0, 360)
##D pixels <- 10
##D grid <- expand.grid(lon = seq((min(coordinates(locations)[, 1]) - .1),
##D                               (max(coordinates(locations)[, 1]) + .1),
##D                               length.out = pixels),
##D                     lat = seq((min(coordinates(locations)[, 2]) - .1),
##D                               (max(coordinates(locations)[, 2]) + .1),
##D                               length.out = pixels))
##D grid <- SpatialPoints(grid)
##D proj4string(grid) <- CRS(crs_string)
##D ## bind the extrapolated values for plotting
##D df <- cbind(idw360(values, locations, grid), as.data.frame(grid))
##D ggplot(df, aes(lon, lat)) +
##D   geom_point(size = .1) +
##D   geom_spoke(aes(angle = ((90 - pred) %% 360) * pi / 180),
##D              radius = .07,
##D              arrow=arrow(length = unit(0.2,"cm"))) +
##D   coord_map()
## End(Not run)



