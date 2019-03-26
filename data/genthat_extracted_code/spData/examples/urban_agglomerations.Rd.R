library(spData)


### Name: urban_agglomerations
### Title: Major urban areas worldwide
### Aliases: urban_agglomerations
### Keywords: datasets sf

### ** Examples

if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  data(urban_agglomerations)
}
# Code used to download the data:
## Not run: 
##D download.file(destfile = "WUP2014-F11a-30_Largest_Cities.xls",
##D url = "https://esa.un.org/unpd/wup/CD-ROM/WUP2014_XLS_CD_FILES/WUP2014-F11a-30_Largest_Cities.xls")
##D library(dplyr)
##D library(sf)
##D urban_agglomerations = readxl::read_excel("WUP2014-F11a-30_Largest_Cities.xls", skip = 16) %>%
##D     st_as_sf(coords = c("Longitude", "Latitude"), crs = 4326)
##D names(urban_agglomerations) <- gsub(" ", "_", tolower(names(urban_agglomerations)) ) %>% 
##D         gsub("\\(|\\)", "", .)
##D devtools::use_data(urban_agglomerations, overwrite = TRUE)
##D file.remove("WUP2014-F11a-30_Largest_Cities.xls")
## End(Not run)



