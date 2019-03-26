library(osrm)


### Name: osrmIsochrone
### Title: Get a SpatialPolygonsDataFrame of Isochrones
### Aliases: osrmIsochrone

### ** Examples

## Not run: 
##D # Load data
##D data("berlin")
##D 
##D # Get isochones with lon/lat coordinates, default breaks
##D iso <- osrmIsochrone(loc = c(13.43853,52.47728), breaks = seq(0,15,1), res = 70)
##D library(sp)
##D plot(iso, col = colorRampPalette(colors = c('grey80', 'grey20'))(14))
##D 
##D # Map
##D if(require("cartography")){
##D   osm <- getTiles(x = iso, crop = TRUE, type = "osmgrayscale")
##D   tilesLayer(x = osm)
##D   breaks <- sort(c(unique(iso$min), max(iso$max)))
##D   cartography::choroLayer(spdf = iso,
##D                           var = "center", breaks = breaks,
##D                           col = paste0(rev(carto.pal("green.pal",
##D                                                      length(breaks)+1)),99),
##D                           border = NA,
##D                           legend.pos = "topleft",legend.frame = TRUE,
##D                           legend.title.txt = "Isochrones\n(min)",
##D                           add = TRUE)
##D }
##D 
##D 
##D # Get isochones with a SpatialPointsDataFrame, custom breaks
##D iso2 <- osrmIsochrone(loc = apotheke.sp[10,],
##D                       breaks = seq(from = 0, to = 16, by = 2))
##D 
##D # Map
##D if(require("cartography")){
##D   osm2 <- getTiles(x = iso2, crop = FALSE, type = "osmgrayscale")
##D   tilesLayer(x = osm2)
##D   breaks2 <- sort(c(unique(iso2$min), max(iso2$max)))
##D   cartography::choroLayer(spdf = iso2,
##D                           var = "center", breaks = breaks2,
##D                           border = NA,
##D                           legend.pos = "topleft",legend.frame = TRUE,
##D                           legend.title.txt = "Isochrones\n(min)",
##D                           add = TRUE)
##D }
## End(Not run)



