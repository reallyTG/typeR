library(ggmap)


### Name: qmap
### Title: Quick map plot
### Aliases: qmap

### ** Examples


## Not run: 
##D # these examples have been excluded for checking efficiency
##D 
##D qmap(location = "baylor university")
##D qmap(location = "baylor university", zoom = 14)
##D qmap(location = "baylor university", zoom = 14, source = "osm")
##D qmap(location = "baylor university", zoom = 14, source = "osm", scale = 20000)
##D qmap(location = "baylor university", zoom = 14, maptype = "satellite")
##D qmap(location = "baylor university", zoom = 14, maptype = "hybrid")
##D qmap(location = "baylor university", zoom = 14, maptype = "toner", source = "stamen")
##D qmap(location = "baylor university", zoom = 14, maptype = "watercolor", source = "stamen")
##D qmap(location = "baylor university", zoom = 14, maptype = "terrain-background", source = "stamen")
##D qmap(location = "baylor university", zoom = 14, maptype = "toner-lite", source = "stamen")
##D 
##D api_key <- "<your api key here>"
##D qmap(location = "baylor university", zoom = 14, maptype = 15434,
##D   source = "cloudmade", api_key = api_key)
##D 
##D wh <- geocode("the white house")
##D qmap("the white house", maprange = TRUE,
##D   base_layer = ggplot(aes(x=lon, y=lat), data = wh)) +
##D   geom_point()
##D 
##D 
##D 
## End(Not run)




