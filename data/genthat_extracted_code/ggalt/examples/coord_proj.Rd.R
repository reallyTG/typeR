library(ggalt)


### Name: coord_proj
### Title: Similar to 'coord_map' but uses the PROJ.4 library/package for
###   projection transformation
### Aliases: coord_proj

### ** Examples

## Not run: 
##D # World in Winkel-Tripel
##D 
##D # U.S.A. Albers-style
##D usa <- world[world$region == "USA",]
##D usa <- usa[!(usa$subregion %in% c("Alaska", "Hawaii")),]
##D 
##D gg <- ggplot()
##D gg <- gg + geom_cartogram(data=usa, map=usa,
##D                     aes(x=long, y=lat, map_id=region))
##D gg <- gg + coord_proj(
##D              paste0("+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96",
##D                     " +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"))
##D gg
##D 
##D # Showcase Greenland (properly)
##D greenland <- world[world$region == "Greenland",]
##D 
##D gg <- ggplot()
##D gg <- gg + geom_cartogram(data=greenland, map=greenland,
##D                     aes(x=long, y=lat, map_id=region))
##D gg <- gg + coord_proj(
##D              paste0("+proj=stere +lat_0=90 +lat_ts=70 +lon_0=-45 +k=1 +x_0=0",
##D                     " +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"))
##D gg
## End(Not run)



