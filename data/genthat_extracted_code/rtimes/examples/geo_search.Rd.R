library(rtimes)


### Name: geo_search
### Title: Geographic search NYTimes API
### Aliases: geo_search

### ** Examples

## Not run: 
##D geo_search(country_code = 'US')
##D geo_search(feature_class='P', country_code='US', population='50000_')
##D 
##D # FIXME: these should work, but don't anymore
##D #geo_search(elevation = '2000_', feature_class='P')
##D #geo_search(elevation = '_3000', feature_class='P')
##D #geo_search(elevation = '2000_3000', feature_class='P')
##D # geo_search(nearby=c(38.920833,-94.622222), population='100000_', 
##D #   feature_class='P')
##D 
##D # curl options
##D geo_search(country_code = 'US', verbose = TRUE)
## End(Not run)



