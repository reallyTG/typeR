library(OpenStreetMap)


### Name: openproj
### Title: Projects the open street map to an alternate coordinate system
### Aliases: openproj

### ** Examples

## Not run: 
##D library(maps)
##D 
##D #plot bing map in native mercator coords
##D map <- openmap(c(70,-179),
##D 	c(-70,179),zoom=1,type='bing')
##D plot(map)
##D 
##D #using longlat projection lets us combine with the maps library
##D map_longlat <- openproj(map)
##D plot(map_longlat)
##D map("world",col="red",add=TRUE)
##D 
##D #robinson projection. good for whole globe viewing.
##D map_robinson <- openproj(map_longlat, projection=
##D "+proj=robin +lon_0=0 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")
##D plot(map_robinson)
##D 
##D #national parks service images
##D upperMap <- openmap(c(70,-179),
##D 	c(10,50),zoom=2,type='nps')
##D #Lambert Conic Conformal
##D map_llc <- openproj(upperMap, projection=
##D "+proj=lcc +lat_1=33 +lat_2=45 +lat_0=39 +lon_0=-96")
##D plot(map_llc,removeMargin=TRUE)
##D #add choropleth
##D library(sp)
##D data(states)
##D st_llc <- spTransform(states,CRS("+proj=lcc +lat_1=33 +lat_2=45 +lat_0=39 +lon_0=-96"))
##D plot(st_llc,add=T,col=heat.colors(48,.4)[slot(st_llc,"data")[["ORDER_ADM"]]])
##D 
## End(Not run)



