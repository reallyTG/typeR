library(osrm)


### Name: com
### Title: Communes Coordinates
### Aliases: com

### ** Examples

## Not run: 
##D # Load data
##D data("com")
##D 
##D ### osrmTable ###
##D # Inputs are data frames  
##D # Travel time matrix
##D distCom <- osrmTable(loc = com[1:50, c("comm_id","lon","lat")])
##D # First 5 rows and columns
##D distCom$durations[1:5,1:5]
##D 
##D # Travel time matrix with different sets of origins and destinations
##D distCom2 <- osrmTable(src = com[1:10,c("comm_id","lon","lat")],
##D                       dst = com[11:20,c("comm_id","lon","lat")])
##D # First 5 rows and columns
##D distCom2$durations[1:5,1:5]
##D 
##D # Inputs are SpatialPointsDataFrames
##D distCom <- osrmTable(loc = src)
##D # First 5 rows and columns
##D distCom$durations[1:5,1:5]
##D 
##D # Travel time matrix with different sets of origins and destinations
##D distCom2 <- osrmTable(src = src, dst = dst)
##D # First 5 rows and columns
##D distCom2$durations[1:5,1:5]
##D 
##D 
##D ### osrmRoute ###
##D # Travel path between points
##D route <- osrmRoute(src = com[1, c("comm_id", "lon","lat")],
##D                    dst = com[15, c("comm_id", "lon","lat")])
##D # Display the path
##D plot(com[c(1,15),3:4], asp =1, col = "red", pch = 20, cex = 1.5)
##D points(route[,1:2], type = "l", lty = 2)
##D text(com[c(1,15),3:4], labels = com[c(1,15),2], pos = 2)
##D 
##D # Travel path between points - output a SpatialLinesDataFrame
##D route2 <- osrmRoute(src=c("Bethune", 2.64781, 50.5199),
##D                     dst = c("Renescure", 2.369521, 50.72761),
##D                     sp = TRUE, overview = "full")
##D 
##D # Display the path
##D plot(com[c(1,4),3:4], asp =1, col = "red", pch = 20, cex = 1.5)
##D plot(route2, lty = 1,lwd = 4, add = TRUE)
##D plot(route2, lty = 1, lwd = 1, col = "white", add=TRUE)
##D text(com[c(1,4),3:4], labels = com[c(1,4),2], pos = 2)
##D 
##D # Input is SpatialPointsDataFrames
##D route3 <- osrmRoute(src = src[1,], dst = dst[1,], sp = TRUE)
##D route3@data
##D 
##D 
##D 
##D ### osrmTrip ###
##D # Get a trip with a id lat lon data.frame
##D trips <- osrmTrip(loc = com[1:9, c(1,3,4)])
##D 
##D # Display the trip
##D plot(trips[[1]]$trip , col = 1:5)
##D points(com[1:10, 3:4], pch = 20, col = "red", cex = 0.5)
##D 
##D # Map
##D if(require("cartography")){
##D   osm <- getTiles(x = trips[[1]]$trip, crop = TRUE, type = "osmgrayscale")
##D   tilesLayer(x = osm)
##D   plot(trips[[1]]$trip, col = 1:5, add = TRUE)
##D   points(com[1:9, 3:4], pch = 20, col = "red", cex = 2)
##D }
##D 
##D # Get a trip with a SpatialPointsDataFrame
##D trips <- osrmTrip(loc = src)
##D 
##D # Map
##D if(require("cartography")){
##D   osm <- getTiles(x = trips[[1]]$trip, crop = TRUE, type = "osmgrayscale")
##D   tilesLayer(x = osm)
##D   plot(src, pch = 20, col = "red", cex = 2, add = TRUE)
##D   plot(trips[[1]]$trip, col = 1:5, add = TRUE, lwd=2)
##D }
##D 
##D 
##D ### osrmIsochrone
##D # Get isochones with lon/lat coordinates, default breaks
##D iso <- osrmIsochrone(loc = c(6.026875, 48.93447))
##D plot(iso, col = paste0(rep("grey", nrow(iso)), c(seq(80,20,length.out = nrow(iso)))))
##D 
##D # Map
##D if(require("cartography")){
##D   osm <- getTiles(x = iso, crop = TRUE, type = "osmgrayscale")
##D   tilesLayer(x = osm)
##D   breaks <- sort(c(unique(iso$min), max(iso$max)))
##D   cartography::choroLayer(spdf = iso,
##D                           var = "center", breaks = breaks,
##D                           border = NA,
##D                           legend.pos = "topleft",legend.frame = TRUE, 
##D                           legend.title.txt = "Isochrones\n(min)", 
##D                           add = TRUE)
##D }
##D 
##D # Get isochones with a SpatialPointsDataFrame, custom breaks
##D iso2 <- osrmIsochrone(loc = src[1,], breaks = seq(from = 0, to = 40, by = 5))
##D 
##D # Map
##D if(require("cartography")){
##D   osm2 <- getTiles(x = iso2, crop = TRUE, type = "osmgrayscale")
##D   tilesLayer(x = osm2)
##D   breaks2 <- sort(c(unique(iso2$min), max(iso2$max)))
##D   cartography::choroLayer(spdf = iso2,
##D                           var = "center", breaks = breaks2,
##D                           border = NA,
##D                           legend.pos = "topleft",legend.frame = TRUE, 
##D                           legend.title.txt = "Isochrones\n(min)", 
##D                           add = TRUE)
##D }
##D 
## End(Not run)



