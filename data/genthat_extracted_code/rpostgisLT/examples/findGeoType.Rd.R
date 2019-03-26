library(rpostgisLT)


### Name: findGeoType
### Title: Figures out whether the provided database relation contains
###   vector or raster data.
### Aliases: findGeoType
### Keywords: internal

### ** Examples

## Not run: 
##D layers <- list(c("example_data", "county_subdiv"), c("public", "florida_dem"))
##D geo_type <- findGeoType(conn, layers)
##D geo_type$vect[[1]]
## End(Not run)



