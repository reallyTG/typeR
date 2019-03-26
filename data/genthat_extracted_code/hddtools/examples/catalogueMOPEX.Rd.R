library(hddtools)


### Name: catalogueMOPEX
### Title: Data source: MOPEX catalogue
### Aliases: catalogueMOPEX

### ** Examples

## Not run: 
##D   # Retrieve the MOPEX catalogue
##D   MOPEX_catalogue_all <- catalogueMOPEX()
##D 
##D   # Define a bounding box
##D   areaBox <- raster::extent(-95, -92, 37, 41)
##D   # Filter the catalogue based on bounding box
##D   MOPEX_catalogue_bbox <- catalogueMOPEX(areaBox = areaBox)
##D 
##D   # Get only catchments within NC
##D   MOPEX_catalogue_state <- catalogueMOPEX(columnName = "state",
##D                                           columnValue = "NC")
##D 
## End(Not run)




