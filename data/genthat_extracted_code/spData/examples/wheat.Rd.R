library(spData)


### Name: wheat
### Title: Mercer and Hall wheat yield data
### Aliases: wheat
### Keywords: datasets sf

### ** Examples

## Not run: 
##D data(wheat)
##D wheat$lat1 <- 69 - wheat$lat
##D wheat$r <- factor(wheat$lat1)
##D wheat$c <- factor(wheat$lon)
##D wheat_sp <- wheat
##D coordinates(wheat_sp) <- c("lon", "lat1")
##D wheat_spg <- wheat_sp
##D 
##D gridded(wheat_spg) <- TRUE
##D wheat_spl <- as(wheat_spg, "SpatialPolygons")
##D df <- as(wheat_spg, "data.frame")
##D row.names(df) <- sapply(slot(wheat_spl, "polygons"),
##D                         function(x) slot(x, "ID"))
##D wheat <- SpatialPolygonsDataFrame(wheat_spl, data=df)
## End(Not run)

if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  wheat <- st_read(system.file("shapes/wheat.shp", package="spData"))
  plot(wheat)
}



