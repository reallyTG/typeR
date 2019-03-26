library(ggalt)


### Name: geom_cartogram
### Title: Map polygons layer enabling the display of show statistical
###   information
### Aliases: geom_cartogram

### ** Examples

## Not run: 
##D # When using geom_polygon, you will typically need two data frames:
##D # one contains the coordinates of each polygon (positions),  and the
##D # other the values associated with each polygon (values).  An id
##D # variable links the two together
##D 
##D ids <- factor(c("1.1", "2.1", "1.2", "2.2", "1.3", "2.3"))
##D 
##D values <- data.frame(
##D   id = ids,
##D   value = c(3, 3.1, 3.1, 3.2, 3.15, 3.5)
##D )
##D 
##D positions <- data.frame(
##D   id = rep(ids, each = 4),
##D   x = c(2, 1, 1.1, 2.2, 1, 0, 0.3, 1.1, 2.2, 1.1, 1.2, 2.5, 1.1, 0.3,
##D   0.5, 1.2, 2.5, 1.2, 1.3, 2.7, 1.2, 0.5, 0.6, 1.3),
##D   y = c(-0.5, 0, 1, 0.5, 0, 0.5, 1.5, 1, 0.5, 1, 2.1, 1.7, 1, 1.5,
##D   2.2, 2.1, 1.7, 2.1, 3.2, 2.8, 2.1, 2.2, 3.3, 3.2)
##D )
##D 
##D ggplot() +
##D   geom_cartogram(aes(x, y, map_id = id), map = positions, data=positions)
##D 
##D ggplot() +
##D   geom_cartogram(aes(x, y, map_id = id), map = positions, data=positions) +
##D   geom_cartogram(data=values, map=positions, aes(fill = value, map_id=id))
##D 
##D ggplot() +
##D   geom_cartogram(aes(x, y, map_id = id), map = positions, data=positions) +
##D   geom_cartogram(data=values, map=positions, aes(fill = value, map_id=id)) +
##D   ylim(0, 3)
##D 
##D # Better example
##D crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
##D crimesm <- reshape2::melt(crimes, id = 1)
##D 
##D if (require(maps)) {
##D 
##D   states_map <- map_data("state")
##D 
##D   ggplot() +
##D     geom_cartogram(aes(long, lat, map_id = region), map = states_map, data=states_map) +
##D     geom_cartogram(aes(fill = Murder, map_id = state), map=states_map, data=crimes)
##D 
##D   last_plot() + coord_map("polyconic")
##D 
##D   ggplot() +
##D     geom_cartogram(aes(long, lat, map_id=region), map = states_map, data=states_map) +
##D     geom_cartogram(aes(fill = value, map_id=state), map = states_map, data=crimesm) +
##D     coord_map("polyconic") +
##D     facet_wrap( ~ variable)
##D }
## End(Not run)



