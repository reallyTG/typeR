library(malariaAtlas)


### Name: listData
### Title: List data available to download from the MAP geoserver.
### Aliases: listData

### ** Examples

## No test: 
available_admin_units <- listShp()
available_pr_points <- listPoints(sourcedata = "pr points")
available_vector_points <- listPoints(sourcedata = "vector points")
available_rasters <- listRaster()
## End(No test)



