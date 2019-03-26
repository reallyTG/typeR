library(cancensus)


### Name: census_vectors
### Title: Return Census variable names and labels as a tidy data frame
###   (Deprecated)
### Aliases: census_vectors

### ** Examples

## Not run: 
##D # Query census data with truncated labels:
##D census_data <- get_census(dataset='CA16', regions=list(CMA="59933"),
##D                           vectors=c("v_CA16_408","v_CA16_409","v_CA16_410"),
##D                           level='CSD', geo_format = "sf", labels="short")
##D 
##D # Get details for truncated vectors:
##D census_vectors(census_data)
## End(Not run)



