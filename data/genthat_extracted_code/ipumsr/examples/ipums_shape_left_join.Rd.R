library(ipumsr)


### Name: ipums_shape_left_join
### Title: Join data to geographic boundaries
### Aliases: ipums_shape_left_join ipums_shape_right_join
###   ipums_shape_inner_join ipums_shape_full_join

### ** Examples

# Note that these examples use NHGIS data so that they use the example data provided,
# but the functions read_nhgis_sf/read_nhgis_sp perform this merge for you.

data <- read_nhgis(ipums_example("nhgis0008_csv.zip"))

if (require(sf)) {
  sf <- read_ipums_sf(ipums_example("nhgis0008_shape_small.zip"))
  data_sf <- ipums_shape_inner_join(data, sf, by = "GISJOIN")
}

if (require(sp) && require(rgdal)) {
  sp <- read_ipums_sp(ipums_example("nhgis0008_shape_small.zip"))
  data_sp <- ipums_shape_inner_join(data, sp, by = "GISJOIN")
}

## Not run: 
##D   # Sometimes variable names won't match between datasets (for example in IPUMS international)
##D   data <- read_ipums_micro("ipumsi_00004.xml")
##D   shape <- read_ipums_sf("geo2_br1980_2010.zip")
##D   data_sf <- ipums_shape_inner_join(data, shape, by = c("GEO2" = "GEOLEVEL2"))
## End(Not run)




