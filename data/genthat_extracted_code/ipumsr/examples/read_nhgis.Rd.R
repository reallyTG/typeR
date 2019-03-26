library(ipumsr)


### Name: read_nhgis
### Title: Read data from an NHGIS extract
### Aliases: read_nhgis read_nhgis_sf read_nhgis_sp

### ** Examples

csv_file <- ipums_example("nhgis0008_csv.zip")
shape_file <- ipums_example("nhgis0008_shape_small.zip")

data_only <- read_nhgis(csv_file)

# If sf package is availble, can load as sf object
if (require(sf)) {
  sf_data <- read_nhgis_sf(csv_file, shape_file)
}

# If sp package is available, can load as SpatialPolygonsDataFrame
if (require(rgdal) && require(sp)) {
  sp_data <- read_nhgis_sp(csv_file, shape_file)
}




