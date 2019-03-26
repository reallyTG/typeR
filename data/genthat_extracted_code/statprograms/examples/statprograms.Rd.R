library(statprograms)


### Name: statprograms
### Title: Graduate Statistics Program Data
### Aliases: statprograms
### Keywords: datasets

### ** Examples

## Not run: 
##D data(statprograms)
##D summary(statprograms)
##D 
##D #----------------------------------------------------------------------------
##D # Plot locations on a map
##D #----------------------------------------------------------------------------
##D library(maps)
##D library(ggplot2)
##D library(mapproj)
##D 
##D us_states <- map_data("state")
##D 
##D ggplot(
##D   data = statprograms[statprograms$state != "Alaska", ],
##D   mapping = aes(x = longitude, y = latitude)
##D ) +
##D   geom_polygon(
##D     data = us_states,
##D     aes(x = long, y = lat, group = group),
##D     fill = "white",
##D     color = "gray50",
##D     size = 0.5
##D   ) +
##D   geom_point() +
##D   guides(fill = FALSE) +
##D   coord_map(
##D     projection = "albers",
##D     lat0 = 39,
##D     lat1 = 45
##D   ) +
##D   theme_bw()
## End(Not run)



