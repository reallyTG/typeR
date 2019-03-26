library(ipumsr)


### Name: read_ipums_sf
### Title: Read boundary files from an IPUMS extract
### Aliases: read_ipums_sf read_ipums_sp

### ** Examples

shape_file <- ipums_example("nhgis0008_shape_small.zip")
# If sf package is availble, can load as sf object
if (require(sf)) {
  sf_data <- read_ipums_sf(shape_file)
}

# If sp package is available, can load as SpatialPolygonsDataFrame
if (require(sp) && require(rgdal)) {
  sp_data <- read_ipums_sp(shape_file)
}




