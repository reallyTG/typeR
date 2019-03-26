library(hddtools)


### Name: catalogueData60UK
### Title: Data source: Data60UK catalogue
### Aliases: catalogueData60UK

### ** Examples

## Not run: 
##D   # Retrieve the whole catalogue
##D   Data60UK_catalogue_all <- catalogueData60UK()
##D 
##D   # Filter the catalogue based on a bounding box
##D   areaBox <- raster::extent(-4, -2, +52, +53)
##D   Data60UK_catalogue_bbox <- catalogueData60UK(areaBox)
##D 
##D   # Filter the catalogue based on an ID
##D   Data60UK_catalogue_ID <- catalogueData60UK(columnName = "stationID",
##D                                              columnValue = "62001")
## End(Not run)




