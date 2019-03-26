library(osmplotr)


### Name: connect_highways
### Title: connect_highways
### Aliases: connect_highways

### ** Examples

bbox <- get_bbox (c (-0.13, 51.5, -0.11, 51.52))
## Not run: 
##D highways <- c ('Monmouth.St', 'Short.?s.Gardens', 'Endell.St', 'Long.Acre',
##D                'Upper.Saint.Martin')
##D # Note that dots signify "anything", including whitespace and apostrophes, and
##D # that '?' denotes optional previous character and so here matches both 
##D # "Shorts Gardens" and "Short's Gardens"
##D highways1 <- connect_highways (highways = highways, bbox = bbox, plot = TRUE)
##D highways <- c ('Endell.St', 'High.Holborn', 'Drury.Lane', 'Long.Acre')
##D highways2 <- connect_highways (highways = highways, bbox = bbox, plot = TRUE)
##D 
##D # Use of 'connect_highways' to highlight a region on a map
##D map <- osm_basemap (bbox = bbox, bg = 'gray20')
##D # dat_B <- extract_osm_data (key = 'building', value = '!residential', bbox = bbox)
##D # Those data are part of 'osmplotr':
##D dat_BNR <- london$dat_BNR # Non-residential buildings
##D groups <- list (highways1, highways2)
##D map <- add_osm_groups (map, obj = dat_BNR, groups = groups,
##D                        cols = c('red', 'blue'), bg = 'gray40')
##D print_osm_map (map)
## End(Not run)



