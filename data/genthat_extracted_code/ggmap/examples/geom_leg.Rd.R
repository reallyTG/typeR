library(ggmap)


### Name: geom_leg
### Title: Single line segments with rounded ends
### Aliases: geom_leg

### ** Examples


## Not run: 
##D  # removed for R CMD check speed
##D 
##D map <- get_map(
##D   location = c(-77.0425, 38.8925), # painfully picked by hand
##D   source = "google", zoom = 14, maptype = "satellite"
##D )
##D ggmap(map)
##D 
##D 
##D (legs_df <- route(
##D   "the white house, dc",
##D   "lincoln memorial washington dc",
##D   alternatives = TRUE
##D ))
##D 
##D ggplot(data = legs_df) +
##D   geom_leg(aes(
##D     x = startLon, xend = endLon,
##D     y = startLat, yend = endLat
##D   )) +
##D   coord_map()
##D 
##D ggplot(data = legs_df) +
##D   geom_leg(aes(
##D     x = startLon, xend = endLon,
##D     y = startLat, yend = endLat,
##D     color = route
##D   )) +
##D   coord_map()
##D 
##D 
##D ggmap(map) +
##D   geom_leg(
##D     aes(
##D       x = startLon, xend = endLon,
##D       y = startLat, yend = endLat
##D     ),
##D     data = legs_df, color = "red"
##D   )
##D 
##D # adding a color aesthetic errors because of a base-layer problem
##D # ggmap(map) +
##D #   geom_leg(
##D #     aes(
##D #       x = startLon, xend = endLon,
##D #       y = startLat, yend = endLat,
##D #       color = route
##D #   )
##D # )
##D 
##D 
##D # this is probably the easiest hack to fix it
##D ggplot(data = legs_df) +
##D   inset_ggmap(map) +
##D   geom_leg(
##D     aes(
##D       x = startLon, xend = endLon,
##D       y = startLat, yend = endLat,
##D       color = route
##D     ),
##D     data = legs_df
##D   ) +
##D   coord_map()
##D 
## End(Not run)


## Not run: 
##D  # removed for R CMD check speed
##D 
##D map <- get_map(
##D   location = c(-77.0425, 38.8925), # painfully picked by hand
##D   source = "google", zoom = 14, maptype = "satellite"
##D )
##D ggmap(map)
##D 
##D 
##D (legs_df <- route(
##D   "the white house, dc",
##D   "lincoln memorial washington dc",
##D   alternatives = TRUE
##D ))
##D 
##D ggplot(data = legs_df) +
##D   geom_leg(aes(
##D     x = startLon, xend = endLon,
##D     y = startLat, yend = endLat
##D   )) +
##D   coord_map()
##D 
##D ggplot(data = legs_df) +
##D   geom_leg(aes(
##D     x = startLon, xend = endLon,
##D     y = startLat, yend = endLat,
##D     color = route
##D   )) +
##D   coord_map()
##D 
##D 
##D ggmap(map) +
##D   geom_leg(
##D     aes(
##D       x = startLon, xend = endLon,
##D       y = startLat, yend = endLat
##D     ),
##D     data = legs_df, color = "red"
##D   )
##D 
##D # adding a color aesthetic errors because of a base-layer problem
##D # ggmap(map) +
##D #   geom_leg(
##D #     aes(
##D #       x = startLon, xend = endLon,
##D #       y = startLat, yend = endLat,
##D #       color = route
##D #   )
##D # )
##D 
##D 
##D # this is probably the easiest hack to fix it
##D ggplot(data = legs_df) +
##D   inset_ggmap(map) +
##D   geom_leg(
##D     aes(
##D       x = startLon, xend = endLon,
##D       y = startLat, yend = endLat,
##D       color = route
##D     ),
##D     data = legs_df
##D   ) +
##D   coord_map()
##D 
## End(Not run)




