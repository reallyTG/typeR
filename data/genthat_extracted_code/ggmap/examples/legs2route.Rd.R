library(ggmap)


### Name: legs2route
### Title: Convert a leg-structured route to a route-structured route
### Aliases: legs2route

### ** Examples


## Not run: 
##D 
##D (legs_df <- route("houston","galveston"))
##D legs2route(legs_df)
##D (legs_df <- route(
##D   "marrs mclean science, baylor university",
##D   "220 south 3rd street, waco, tx 76701", # ninfa"s
##D   alternatives = TRUE))
##D 
##D legs2route(legs_df)
##D 
##D 
##D 
##D 
##D from <- "houson, texas"
##D to <- "waco, texas"
##D legs_df <- route(from, to)
##D 
##D 
##D qmap("college station, texas", zoom = 8) +
##D   geom_segment(
##D     aes(x = startLon, y = startLat, xend = endLon, yend = endLat),
##D     colour = "red", size = 1.5, data = legs_df
##D   )
##D # notice boxy ends
##D 
##D qmap("college station, texas", zoom = 8) +
##D   geom_leg(
##D     aes(x = startLon, y = startLat, xend = endLon, yend = endLat),
##D     colour = "red", size = 1.5, data = legs_df
##D   )
##D # notice overshooting ends
##D 
##D route_df <- legs2route(legs_df)
##D qmap("college station, texas", zoom = 8) +
##D   geom_path(
##D     aes(x = lon, y = lat),
##D     colour = "red", size = 1.5, data = route_df, lineend = "round"
##D   )
##D 
##D 
##D 
## End(Not run)




