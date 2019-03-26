library(rsMove)


### Name: moveCloud
### Title: moveCloud
### Aliases: moveCloud

### ** Examples

## Not run: 
##D 
##D  require(raster)
##D 
##D  # read movement data
##D  data(shortMove)
##D 
##D  # test function for 30 day buffer
##D  od <- as.Date(shortMove@data$date)
##D  c.cover <- moveCloud(shortMove, od, data.path=".", buffer.size=c(30,30))
##D 
## End(Not run)



