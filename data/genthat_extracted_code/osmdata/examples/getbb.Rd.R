library(osmdata)


### Name: getbb
### Title: Get bounding box for a given place name
### Aliases: getbb

### ** Examples

## Not run: 
##D getbb("Salzburg")
##D # select based on display_name, print query url
##D getbb("Hereford", display_name_contains = "United States", silent = FALSE)
##D # top 3 matches as data frame
##D getbb("Hereford", format_out = "data.frame", limit = 3)
##D # Examples of polygonal boundaries
##D bb <- getbb ("london uk", format_out = "polygon") # single match
##D dim(bb[[1]]) # matrix of longitude/latitude pairs
##D bb_sf = getbb("kathmandu", format_out = "sf_polygon") 
##D # sf:::plot.sf(bb_sf) # can be plotted if sf is installed
##D getbb("london", format_out = "sf_polygon") # only selects 1st of multipolygons
##D getbb("accra", format_out = "sf_polygon") # rectangular bb
##D # Using an alternative service (locationiq requires an API key)
##D key <- Sys.getenv("LOCATIONIQ") # add LOCATIONIQ=type_your_api_key_here to .Renviron
##D if(nchar(key) ==  32) {
##D   getbb(place_name, base_url = "http://locationiq.org/v1/search.php", key = key)
##D }
## End(Not run)



