library(hddtools)


### Name: catalogueGRDC
### Title: Data source: Global Runoff Data Centre catalogue
### Aliases: catalogueGRDC

### ** Examples

## Not run: 
##D   # Retrieve the whole catalogue
##D   GRDC_catalogue_all <- catalogueGRDC()
##D 
##D   # Define a bounding box
##D   areaBox <- raster::extent(-3.82, -3.63, 52.41, 52.52)
##D   # Filter the catalogue based on bounding box
##D   GRDC_catalogue_bbox <- catalogueGRDC(areaBox = areaBox)
##D 
##D   # Get only catchments with area above 5000 Km2
##D   GRDC_catalogue_area <- catalogueGRDC(columnName = "area",
##D                                        columnValue = ">= 5000")
##D 
##D   # Get only catchments within river Thames
##D   GRDC_catalogue_river <- catalogueGRDC(columnName = "river",
##D                                         columnValue = "Thames")
## End(Not run)




