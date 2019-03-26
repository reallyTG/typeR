library(mregions)


### Name: mr_features_get
### Title: Get features
### Aliases: mr_features_get

### ** Examples

## Not run: 
##D # json by default
##D mr_features_get(type = "MarineRegions:eez", featureID = "eez.3")
##D # csv
##D mr_features_get(type = "MarineRegions:eez", featureID = "eez.3",
##D   format = "csv")
##D # KML
##D mr_features_get(type = "MarineRegions:eez", featureID = "eez.3",
##D   format = "KML")
##D 
##D # if you want SHAPE-ZIP, give a file path
##D # FIXME - shape files not working right now
##D # file <- tempfile(fileext = ".zip")
##D # mr_features_get(type = "MarineRegions:eez", featureID = "eez.3",
##D #   format = "SHAPE-ZIP", path = file)
##D # file.exists(file)
##D # unlink(file)
##D 
##D # glm32
##D mr_features_get(type = "MarineRegions:eez", featureID = "eez.3",
##D   format = "gml32")
##D 
##D # version parameter
##D ## notice the reversed coordinates
##D mr_features_get(type = "MarineRegions:eez", featureID = "eez.3")
##D mr_features_get(type = "MarineRegions:eez", featureID = "eez.3",
##D   version = "1.0.0")
## End(Not run)



