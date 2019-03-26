library(highcharter)


### Name: hcmap
### Title: Shortcut for create map from <URL:
###   https://code.highcharts.com/mapdata/> collection.
### Aliases: hcmap

### ** Examples


## Not run: 
##D 
##D hcmap(nullColor = "#DADADA")
##D hcmap(nullColor = "#DADADA", download_map_data = FALSE)
##D 
##D require(dplyr) 
##D data("USArrests", package = "datasets")
##D USArrests <- mutate(USArrests, "woe-name" = rownames(USArrests))
##D 
##D hcmap(map = "countries/us/us-all", data = USArrests,
##D       joinBy = "woe-name", value = "UrbanPop", name = "Urban Population")
##D       
##D # download_map_data = FALSE        
##D hcmap(map = "countries/us/us-all", data = USArrests,
##D       joinBy = "woe-name", value = "UrbanPop", name = "Urban Population",
##D       download_map_data = FALSE) 
##D   
## End(Not run)



