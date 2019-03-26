library(cancensus)


### Name: get_census
### Title: Access to Canadian census data through the CensusMapper API
### Aliases: get_census get_census_geometry
### Keywords: api canada census data

### ** Examples

# Query the API for data on dwellings in Vancouver, at the census subdivision
# level:
## Not run: 
##D census_data <- get_census(dataset='CA16', regions=list(CMA="59933"),
##D                           vectors=c("v_CA16_408","v_CA16_409","v_CA16_410"),
##D                           level='CSD')
##D 
##D # Query the API for data on dwellings in Vancouver, at the census subdivision
##D # level, and return the associated geography files in \code{sf} format:
##D census_data <- get_census(dataset='CA16', regions=list(CMA="59933"),
##D                           vectors=c("v_CA16_408","v_CA16_409","v_CA16_410"),
##D                           level='CSD', geo_format = "sf")
##D 
##D # Make the same query, but return geography in \code{sp} format:
##D census_data <- get_census(dataset='CA16', regions=list(CMA="59933"),
##D                           vectors=c("v_CA16_408","v_CA16_409","v_CA16_410"),
##D                           level='CSD', geo_format = "sf")
##D 
##D # Make the same query, but this time drop descriptive vector names:
##D census_data <- get_census(dataset='CA16', regions=list(CMA="59933"),
##D                           vectors=c("v_CA16_408","v_CA16_409","v_CA16_410"),
##D                           level='CSD', geo_format = "sf", labels="short")
##D 
##D # Get details for truncated vectors:
##D label_vectors(census_data)
## End(Not run)
## Not run: 
##D # Query the API for census subdivision boundary geometry within Vancouver.
##D vc_csds <- get_census_geometry(dataset='CA16', regions=list(CMA="59933"),
##D                                level='CSD', geo_format = "sf")
## End(Not run)



