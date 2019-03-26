library(osrm)


### Name: osrmTrip
### Title: Get the Travel Geometry Between Multiple Unordered Points
### Aliases: osrmTrip

### ** Examples

## Not run: 
##D # Load data
##D data("berlin")
##D 
##D # Get a trip with a id lat lon data.frame
##D trips <- osrmTrip(loc = apotheke.df)
##D 
##D # Display the trip
##D library(sp)
##D plot(trips[[1]]$trip, col = "black", lwd = 4)
##D plot(trips[[1]]$trip, col = c("red", "white"), lwd = 1, add=T)
##D points(apotheke.df[, 2:3], pch = 21, bg = "red", cex = 1)
##D 
##D # Do not route through motorways
##D trips_no_motorway <- osrmTrip(loc = apotheke.df, exclude = "motorway")
##D 
##D # Looks like it may be convenient to avoid motorways...
##D mapply(`/`, trips_no_motorway[[1]]$summary, trips[[1]]$summary)
##D 
##D # Display the trips
##D plot(trips[[1]]$trip, col = "black", lwd = 3)
##D plot(trips_no_motorway[[1]]$trip, col = "green", lwd = 3, add = T)
##D points(apotheke.df[, 2:3], pch = 21, bg = "red", cex = 1)
##D 
##D # Map
##D if(require("cartography")){
##D   osm <- getTiles(x = trips[[1]]$trip, crop = TRUE,
##D                   type = "cartolight", zoom = 11)
##D   tilesLayer(x = osm)
##D   plot(trips[[1]]$trip, col = "black", lwd = 4, add=T)
##D   plot(trips[[1]]$trip, col = c("red", "white"), lwd = 1, add=T)
##D   points(apotheke.df[, 2:3], pch = 21, bg = "red", cex = 1)
##D }
##D 
##D # Get a trip with a SpatialPointsDataFrame
##D trips <- osrmTrip(loc = apotheke.sp[1:10,])
##D 
##D # Map
##D if(require("cartography")){
##D   osm <- getTiles(x = trips[[1]]$trip, crop = TRUE,
##D                   type = "cartolight", zoom = 11)
##D   tilesLayer(x = osm)
##D   plot(trips[[1]]$trip, col = "black", lwd = 4, add=T)
##D   plot(trips[[1]]$trip, col = c("red", "white"), lwd = 1, add=T)
##D   plot(apotheke.sp[1:10,], pch = 21, bg = "red", cex = 1, add=T)
##D }
## End(Not run)



