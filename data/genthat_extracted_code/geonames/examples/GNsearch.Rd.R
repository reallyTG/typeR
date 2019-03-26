library(geonames)


### Name: GNsearch
### Title: search geonames
### Aliases: GNsearch

### ** Examples

## Not run: 
##D # Find places called Lancaster and 'geocode' the result
##D (lanc_df <- GNsearch(name = "Lancaster", country = "UK"))
##D lanc_coords <- lanc_df[1, c("lng", "lat")]
## End(Not run)



