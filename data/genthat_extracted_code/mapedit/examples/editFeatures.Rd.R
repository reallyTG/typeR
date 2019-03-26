library(mapedit)


### Name: editFeatures
### Title: Interactively Edit Map Features
### Aliases: editFeatures editFeatures.sf editFeatures.Spatial

### ** Examples

## Not run: 
##D library(mapedit)
##D library(mapview)
##D 
##D lf <- mapview()
##D 
##D # draw some polygons that we will select later
##D drawing <- lf %>%
##D   editMap()
##D 
##D # little easier now with sf
##D mapview(drawing$finished)
##D 
##D # especially easy with selectFeatures
##D selectFeatures(drawing$finished)
##D 
##D 
##D # use @bhaskarvk USA Albers with leaflet code
##D #  https://bhaskarvk.github.io/leaflet/examples/proj4Leaflet.html
##D #devtools::install_github("hrbrmstr/albersusa")
##D library(albersusa)
##D library(sf)
##D library(leaflet)
##D library(mapedit)
##D 
##D spdf <- usa_sf()
##D pal <- colorNumeric(
##D   palette = "Blues",
##D   domain = spdf$pop_2014
##D )
##D 
##D bounds <- c(-125, 24 ,-75, 45)
##D 
##D (lf <- leaflet(
##D   options=
##D     leafletOptions(
##D       worldCopyJump = FALSE,
##D       crs=leafletCRS(
##D         crsClass="L.Proj.CRS",
##D         code='EPSG:2163',
##D         proj4def=paste0(
##D           '+proj=laea +lat_0=45 +lon_0=-100 +x_0=0 +y_0=0 +a=6370997 ',
##D           '+b=6370997 +units=m +no_defs'
##D         ),
##D         resolutions = c(65536, 32768, 16384, 8192, 4096, 2048,1024, 512, 256, 128)
##D       )
##D     )
##D   ) %>%
##D   fitBounds(bounds[1], bounds[2], bounds[3], bounds[4]) %>%
##D   setMaxBounds(bounds[1], bounds[2], bounds[3], bounds[4]) %>%
##D   mapview::addFeatures(
##D     data=spdf, weight = 1, color = "#000000",
##D     # adding group necessary for identification
##D     layerId = ~iso_3166_2,
##D     fillColor=~pal(pop_2014),
##D     fillOpacity=0.7,
##D     label=~stringr::str_c(name,' ', format(pop_2014, big.mark=",")),
##D     labelOptions= labelOptions(direction = 'auto')
##D   )
##D )
##D 
##D 
##D # test out selectMap with albers example
##D selectMap(
##D   lf,
##D   styleFalse = list(weight = 1),
##D   styleTrue = list(weight = 4)
##D )
## End(Not run)



