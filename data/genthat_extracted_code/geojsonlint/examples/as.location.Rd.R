library(geojsonlint)


### Name: as.location
### Title: Convert a path or URL to a location object.
### Aliases: as.location

### ** Examples

## Not run: 
##D # A file
##D file <- system.file("examples", "zillow_or.geojson",
##D   package = "geojsonlint")
##D as.location(file)
##D 
##D # A URL
##D url <- paste0("https://raw.githubusercontent.com/glynnbird/",
##D   "usstatesgeojson/master/california.geojson")
##D as.location(url)
## End(Not run)



