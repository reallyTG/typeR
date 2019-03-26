library(ggmap)


### Name: get_stamenmap
### Title: Get a Stamen Map
### Aliases: get_stamenmap

### ** Examples


## Not run: 
##D  # to diminish run check time
##D 
##D gc <- geocode("baylor university")
##D google <- get_googlemap("baylor university", zoom = 15)
##D ggmap(google) +
##D   geom_point(aes(x = lon, y = lat), data = gc, colour = "red", size = 2)
##D 
##D bbox <- c(left = -97.132, bottom = 31.536, right = -97.105, top = 31.560)
##D ggmap(get_stamenmap(bbox, zoom = 13))
##D ggmap(get_stamenmap(bbox, zoom = 14))
##D ggmap(get_stamenmap(bbox, zoom = 15))
##D # ggmap(get_stamenmap(bbox, zoom = 16))
##D # ggmap(get_stamenmap(bbox, zoom = 17))
##D 
##D # note that the osm code may not run due to overloaded
##D # servers.
##D 
##D # various maptypes are available.  bump it up to zoom = 15 for better resolution.
##D ggmap(get_stamenmap(bbox, maptype = "terrain", zoom = 14))
##D ggmap(get_stamenmap(bbox, maptype = "terrain-background", zoom = 14))
##D ggmap(get_stamenmap(bbox, maptype = "terrain-labels", zoom = 14))
##D ggmap(get_stamenmap(bbox, maptype = "terrain-lines", zoom = 14))
##D ggmap(get_stamenmap(bbox, maptype = "toner", zoom = 14))
##D ggmap(get_stamenmap(bbox, maptype = "toner-2010", zoom = 14))
##D ggmap(get_stamenmap(bbox, maptype = "toner-2011", zoom = 14))
##D ggmap(get_stamenmap(bbox, maptype = "toner-background", zoom = 14))
##D ggmap(get_stamenmap(bbox, maptype = "toner-hybrid", zoom = 14))
##D ggmap(get_stamenmap(bbox, maptype = "toner-labels", zoom = 14))
##D ggmap(get_stamenmap(bbox, maptype = "toner-lines", zoom = 14))
##D ggmap(get_stamenmap(bbox, maptype = "toner-lite", zoom = 14))
##D ggmap(get_stamenmap(bbox, maptype = "watercolor", zoom = 14))
##D 
##D ggmap(get_stamenmap(bbox, maptype = "watercolor", zoom = 11), extent = "device")
##D ggmap(get_stamenmap(bbox, maptype = "watercolor", zoom = 12), extent = "device")
##D ggmap(get_stamenmap(bbox, maptype = "watercolor", zoom = 13), extent = "device")
##D ggmap(get_stamenmap(bbox, maptype = "watercolor", zoom = 14), extent = "device")
##D # ggmap(get_stamenmap(bbox, maptype = "watercolor", zoom = 15), extent = "device")
##D # ggmap(get_stamenmap(bbox, maptype = "watercolor", zoom = 16), extent = "device")
##D # ggmap(get_stamenmap(bbox, maptype = "watercolor", zoom = 17), extent = "device")
##D # ggmap(get_stamenmap(bbox, maptype = "watercolor", zoom = 18), extent = "device")
##D 
##D stamen <- get_stamenmap(bbox, zoom = 15)
##D ggmap(stamen) +
##D   geom_point(aes(x = lon, y = lat), data = gc, colour = "red", size = 2)
##D 
##D stamen <- get_stamenmap(bbox, zoom = 15, crop = FALSE)
##D ggmap(stamen) +
##D   geom_point(aes(x = lon, y = lat), data = gc, colour = "red", size = 2)
##D 
##D 
##D osm <- get_openstreetmap(bbox, scale = OSM_scale_lookup(15))
##D ggmap(osm) +
##D   geom_point(aes(x = lon, y = lat), data = gc, colour = "red", size = 2)
##D 
##D 
##D ggmap(get_stamenmap(bbox, zoom = 15, maptype = "watercolor"))+
##D   geom_point(aes(x = lon, y = lat), data = gc, colour = "red", size = 2)
##D 
##D ggmap(get_stamenmap(bbox, zoom = 15, maptype = "toner"))+
##D   geom_point(aes(x = lon, y = lat), data = gc, colour = "red", size = 2)
##D 
##D 
##D # here's an interesting example:
##D us <- c(left = -125, bottom = 25.75, right = -67, top = 49)
##D map <- get_stamenmap(us, zoom = 5, maptype = "toner-labels")
##D ggmap(map)
##D 
##D 
##D 
##D # accuracy check - white house
##D gc <- geocode("the white house")
##D 
##D qmap("the white house", zoom = 16)  +
##D   geom_point(aes(x = lon, y = lat), data = gc, colour = "red", size = 3)
##D 
##D qmap("the white house", zoom = 16, source = "stamen", maptype = "terrain")  +
##D   geom_point(aes(x = lon, y = lat), data = gc, colour = "red", size = 3)
##D 
##D 
##D 
##D 
##D 
##D # accuracy check - statue of liberty
##D # see https://github.com/dkahle/ggmap/issues/32
##D 
##D gc <- geocode("statue of liberty")
##D 
##D googMapZ10 <- get_googlemap(center = as.numeric(gc))
##D bbZ10 <- attr(googMapZ10, "bb")
##D stamMapZ10 <- get_stamenmap(bb2bbox(bbZ10))
##D 
##D ggmap(googMapZ10) +
##D   geom_point(
##D     aes(x = lon, y = lat),
##D     data = gc, colour = "red", size = 3
##D   )
##D 
##D ggmap(stamMapZ10) +
##D   geom_point(
##D     aes(x = lon, y = lat),
##D     data = gc, colour = "red", size = 3
##D )
##D 
##D 
##D # using a higher zoom
##D googMapZ15 <- get_googlemap(center = as.numeric(gc), zoom = 15)
##D bbZ15 <- attr(googMapZ15, "bb")
##D stamMapZ15 <- get_stamenmap(bb2bbox(bbZ15),
##D   zoom = calc_zoom(bb2bbox(bbZ15))
##D )
##D 
##D ggmap(googMapZ15) +
##D   geom_point(
##D     aes(x = lon, y = lat),
##D     data = gc, colour = "red", size = 3
##D )
##D 
##D ggmap(stamMapZ15) +
##D   geom_point(
##D     aes(x = lon, y = lat),
##D     data = gc, colour = "red", size = 3
##D   )
##D 
##D 
##D # using a lower zoom
##D googMapZ5 <- get_googlemap(center = as.numeric(gc), zoom = 4)
##D bbZ5 <- attr(googMapZ5, "bb")
##D stamMapZ5 <- get_stamenmap(bb2bbox(bbZ5),
##D   zoom = calc_zoom(bb2bbox(bbZ5))
##D )
##D 
##D ggmap(googMapZ5) +
##D   geom_point(
##D     aes(x = lon, y = lat),
##D     data = gc, colour = "red", size = 3
##D   )
##D 
##D ggmap(stamMapZ5) +
##D   geom_point(
##D     aes(x = lon, y = lat),
##D     data = gc, colour = "red", size = 3
##D   )
##D 
##D 
##D stamMapZ5unCropped <- get_stamenmap(bb2bbox(bbZ5),
##D   zoom = calc_zoom(bb2bbox(bbZ5)),
##D   crop = FALSE)
##D 
##D ggmap(stamMapZ5unCropped) +
##D   geom_point(
##D     aes(x = lon, y = lat),
##D     data = gc, colour = "red", size = 3
##D   )
##D 
##D qmap(location = c(lon = -74.0445, lat = 40.68925),
##D     zoom = 16, source = "stamen")  +
##D   geom_point(aes(x = lon, y = lat), data = gc, colour = "red", size = 3)
##D 
## End(Not run) # end dontrun




