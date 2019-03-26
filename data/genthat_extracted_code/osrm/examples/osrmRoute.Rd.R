library(osrm)


### Name: osrmRoute
### Title: Get the Shortest Path Between Two Points
### Aliases: osrmRoute

### ** Examples

## Not run: 
##D # Load data
##D data("berlin")
##D 
##D # Travel path between points
##D route <- osrmRoute(src = apotheke.df[1, c("id", "lon","lat")],
##D                    dst = apotheke.df[16, c("id", "lon","lat")])
##D # Travel path between points excluding motorways
##D route2 <- osrmRoute(src = apotheke.df[1, c("id", "lon","lat")],
##D                     dst = apotheke.df[16, c("id", "lon","lat")], 
##D                     exclude = "motorway")
##D # Display paths
##D plot(route[,1:2], type = "l", lty = 2, asp =1)
##D points(route2[,1:2], type = "l", lty = 2, asp = 1, col = "red")
##D points(apotheke.df[c(1,16),2:3], col = "red", pch = 20, cex = 1.5)
##D text(apotheke.df[c(1,16),2:3], labels = c("A","B"), pos = c(1, 2))
##D 
##D 
##D # Travel path between points between points - output a SpatialLinesDataFrame
##D route3 <- osrmRoute(src = c("A", 13.43853, 52.47728),
##D                     dst = c("B", 13.32247, 52.48882),
##D                     sp = TRUE, overview = "full")
##D # Travel path between points between points - output a SpatialLinesDataFrame 
##D # excluding motorways
##D route4 <- osrmRoute(src = c("A", 13.43853, 52.47728),
##D                     dst = c("B", 13.32247, 52.48882),
##D                     sp = TRUE, overview = "full", exclude = "motorway")
##D # Display the path
##D library(sp)
##D plot(route3, lty = 2, asp = 1)
##D plot(route4, lty = 2, asp = 1, col = "red", add = T)
##D points(x = c(13.43853,13.32247 ), y = c(52.47728, 52.48882), 
##D        col = "red", pch = 20, cex = 1.5)
##D text(x = c(13.43853,13.32247 ), y = c(52.47728, 52.48882), 
##D      labels = c("A","B"), pos = c(1, 2))
##D 
##D 
##D # Input is SpatialPointsDataFrames
##D route5 <- osrmRoute(src = apotheke.sp[1,], dst = apotheke.sp[2,], sp = TRUE)
##D route5@data
## End(Not run)



