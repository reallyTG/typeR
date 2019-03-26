library(ggmap)


### Name: get_googlemap
### Title: Get a Google Map.
### Aliases: get_googlemap

### ** Examples


## Not run: 
##D  # to diminish run check time
##D 
##D 
##D get_googlemap(urlonly = TRUE)
##D ggmap(get_googlemap())
##D 
##D 
##D # markers and paths are easy to access
##D d <- function(x=-95.36, y=29.76, n,r,a){
##D   round(data.frame(
##D     lon = jitter(rep(x,n), amount = a),
##D     lat = jitter(rep(y,n), amount = a)
##D   ), digits = r)
##D }
##D df <- d(n=50,r=3,a=.3)
##D map <- get_googlemap(markers = df, path = df,, scale = 2)
##D ggmap(map)
##D ggmap(map, extent = "device") +
##D   geom_point(aes(x = lon, y = lat), data = df, size = 3, colour = "black") +
##D   geom_path(aes(x = lon, y = lat), data = df)
##D 
##D gc <- geocode("waco, texas", source = "google")
##D center <- as.numeric(gc)
##D ggmap(get_googlemap(center = center, color = "bw", scale = 2), extent = "device")
##D 
##D # the scale argument can be seen in the following
##D # (make your graphics device as large as possible)
##D ggmap(get_googlemap(center, scale = 1), extent = "panel") # pixelated
##D ggmap(get_googlemap(center, scale = 2), extent = "panel") # fine
##D 
##D # archiving; note that you must meet google's terms for this condition
##D map <- get_googlemap(archiving = TRUE)
##D map <- get_googlemap()
##D ggmap(map)
##D 
##D 
##D # style
##D map <- get_googlemap(style = c(feature = "all", element = "labels", visibility = "off"))
##D ggmap(map)
##D 
##D 
##D 
##D 
## End(Not run)




