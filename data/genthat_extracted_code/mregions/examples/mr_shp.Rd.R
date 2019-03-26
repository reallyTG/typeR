library(mregions)


### Name: mr_shp
### Title: Get a region shp file
### Aliases: mr_shp

### ** Examples

## Not run: 
##D ## just get path
##D mr_shp(key = "MarineRegions:eez_iho_union_v2", read = FALSE)
##D ## read shp file into spatial object
##D res <- mr_shp(key = "MarineRegions:eez_iho_union_v2", read = TRUE)
##D 
##D mr_shp(key = "SAIL:w_marinehabitatd")
##D 
##D # maxFeatures
##D library(sp)
##D plot(mr_shp(key = "MarineRegions:eez_iho_union_v2"))
##D plot(mr_shp(key = "MarineRegions:eez_iho_union_v2", maxFeatures = 5))
##D 
##D # vizualize with package leaflet
##D if (requireNamespace("leaflet")) {
##D   library('leaflet')
##D   leaflet() %>%
##D     addTiles() %>%
##D     addPolygons(data = res)
##D }
##D 
##D # use `filter` param to get a subset of a region
##D library(sp)
##D pp <- mr_shp(key = "MarineRegions:eez_iho_union_v2")
##D plot(pp)
##D rr <- mr_shp(key = "MarineRegions:eez_iho_union_v2",
##D   filter = "North Atlantic Ocean")
##D plot(rr)
##D 
##D # get Samoan Exclusive Economic Zone
##D res <- mr_shp(
##D   key = "MarineRegions:eez",
##D   filter = "Samoan Exclusive Economic Zone"
##D )
##D sp::plot(res)
## End(Not run)



