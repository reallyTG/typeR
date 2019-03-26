library(googleway)


### Name: add_polylines
### Title: Add polyline
### Aliases: add_polylines

### ** Examples

## Not run: 
##D 
##D ## using lat/lon coordinates
##D 
##D set_key("your_api_key")
##D 
##D google_map(data = tram_route) %>%
##D   add_polylines(lat = "shape_pt_lat", lon = "shape_pt_lon")
##D 
##D 
##D google_map() %>%
##D   add_polylines(data = melbourne, polyline = "polyline", stroke_weight = 1,
##D       stroke_colour = "SA4_NAME")
##D 
##D ## using encoded polyline and various colour / fill options
##D url <- 'https://raw.githubusercontent.com/plotly/datasets/master/2011_february_aa_flight_paths.csv'
##D flights <- read.csv(url)
##D flights$id <- seq_len(nrow(flights))
##D 
##D 
##D ## encode the routes as polylines
##D lst <- lapply(unique(flights$id), function(x){
##D   lat = c(flights[flights["id"] == x, c("start_lat")], flights[flights["id"] == x, c("end_lat")])
##D   lon = c(flights[flights["id"] == x, c("start_lon")], flights[flights["id"] == x, c("end_lon")])
##D   data.frame(id = x, polyline = encode_pl(lat = lat, lon = lon))
##D })
##D 
##D flights <- merge(flights, do.call(rbind, lst), by = "id")
##D 
##D style <- map_styles()$night
##D 
##D google_map(key = map_key, style = style) %>%
##D   add_polylines(data = flights, polyline = "polyline", mouse_over_group = "airport1",
##D                stroke_weight = 1, stroke_opacity = 0.3, stroke_colour = "#ccffff")
##D 
##D 
## End(Not run)



