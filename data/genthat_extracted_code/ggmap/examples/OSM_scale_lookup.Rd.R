library(ggmap)


### Name: OSM_scale_lookup
### Title: Look up OpenStreetMap scale for a given zoom level.
### Aliases: OSM_scale_lookup

### ** Examples


OSM_scale_lookup(zoom = 3)
OSM_scale_lookup(zoom = 10)

## Not run: 
##D # these can take a long time or are prone to crashing
##D # if the osm server load is too high
##D 
##D # these maps are were the ones used to tailor fit the scale
##D # the zooms were fixed
##D ggmap(get_map(zoom =  3, source = 'osm', scale = 47500000), extent = "device")
##D ggmap(get_map(zoom =  4, source = 'osm', scale = 32500000), extent = "device")
##D ggmap(get_map(zoom =  5, source = 'osm', scale = 15000000), extent = "device")
##D ggmap(get_map(zoom =  6, source = 'osm', scale = 10000000), extent = "device")
##D ggmap(get_map(zoom =  7, source = 'osm', scale =  5000000), extent = "device")
##D ggmap(get_map(zoom =  8, source = 'osm', scale =  2800000), extent = "device")
##D ggmap(get_map(zoom =  9, source = 'osm', scale =  1200000), extent = "device")
##D ggmap(get_map(zoom = 10, source = 'osm', scale =   575000), extent = "device")
##D ggmap(get_map(zoom = 11, source = 'osm', scale =   220000), extent = "device")
##D ggmap(get_map(zoom = 12, source = 'osm', scale =   110000), extent = "device")
##D ggmap(get_map(zoom = 13, source = 'osm', scale =    70000), extent = "device")
##D ggmap(get_map(zoom = 14, source = 'osm', scale =    31000), extent = "device")
##D ggmap(get_map(zoom = 15, source = 'osm', scale =    15000), extent = "device")
##D ggmap(get_map(zoom = 16, source = 'osm', scale =     7500), extent = "device")
##D ggmap(get_map(zoom = 17, source = 'osm', scale =     4000), extent = "device")
##D ggmap(get_map(zoom = 18, source = 'osm', scale =     2500), extent = "device")
##D ggmap(get_map(zoom = 19, source = 'osm', scale =     1750), extent = "device")
##D ggmap(get_map(zoom = 20, source = 'osm', scale =     1000), extent = "device")
##D 
##D # the USA
##D lonR <- c(1.01,.99)*c(-124.73,-66.95)
##D latR <- c(.99,1.01)*c(24.52, 49.38)
##D qmap(lonR = lonR, latR = latR, source = 'osm', scale = 325E5)
##D 
## End(Not run)





