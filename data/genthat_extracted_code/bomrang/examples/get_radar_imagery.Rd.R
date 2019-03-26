library(bomrang)


### Name: get_radar_imagery
### Title: Get BOM Radar Imagery
### Aliases: get_radar_imagery

### ** Examples

## Not run: 
##D # Fetch most recent radar image for Wollongong 256km radar
##D imagery <- get_radar_imagery(product_id = "IDR032")  
##D raster::plot(imagery)  
##D 
##D # Save imagery to a local path  
##D imagery <- get_radar_imagery(product_id = "IDR032", path = 'image.gif') 
##D 
## End(Not run)




