library(googleway)


### Name: add_rectangles
### Title: Add Rectangles
### Aliases: add_rectangles

### ** Examples

## Not run: 
##D 
##D map_key <- 'your_api_key'
##D 
##D df <- data.frame(north = 33.685, south = 33.671, east = -116.234, west = -116.251)
##D 
##D google_map(key = map_key) %>%
##D   add_rectangles(data = df, north = 'north', south = 'south',
##D                  east = 'east', west = 'west')
##D 
##D ## editable rectangle
##D df <- data.frame(north = -37.8459, south = -37.8508, east = 144.9378,
##D                   west = 144.9236, editable = T, draggable = T)
##D 
##D google_map(key = map_key) %>%
##D   add_rectangles(data = df, north = 'north', south = 'south',
##D                  east = 'east', west = 'west',
##D                  editable = 'editable', draggable = 'draggable')
##D 
## End(Not run)



