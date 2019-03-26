library(ggmap)


### Name: route
### Title: Grab a route from Google
### Aliases: route

### ** Examples


## Not run: 
##D  # to cut down on check time
##D 
##D from <- "houson, texas"
##D to <- "waco, texas"
##D route_df <- route(from, to, structure = "route")
##D qmap("college station, texas", zoom = 8) +
##D   geom_path(
##D     aes(x = lon, y = lat),  colour = "red", size = 1.5,
##D     data = route_df, lineend = "round"
##D   )
##D 
##D qmap("college station, texas", zoom = 6) +
##D   geom_path(
##D     aes(x = lon, y = lat), colour = "red", size = 1.5,
##D     data = route_df, lineend = "round"
##D   )
##D 
##D routeQueryCheck()
##D 
##D 
##D 
##D 
## End(Not run)




