library(rmapzen)


### Name: mapzen_references
### Title: Reference lists
### Aliases: mapzen_references mz_sources mz_layers mz_countries
### Keywords: datasets

### ** Examples

## Not run: 
##D # look for YMCAs in Jamaica:
##D # Note that boundary.country is supplied via ISO3166 code,
##D # but mz_countries will look up the code
##D mz_search("YMCA",
##D           boundary.country = mz_countries$Jamaica,
##D           layers = c(mz_layers$venue, mz_layers$address))
## End(Not run)




