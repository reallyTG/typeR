library(rpostgisLT)


### Name: explorePgtraj
### Title: Explore a pgtraj interactively in a Shiny app
### Aliases: explorePgtraj

### ** Examples

## Not run: 
##D # Vectore base layers to include
##D layer_vector <- list(c("example_data", "county_subdiv"),
##D                       c("example_data", "test_points")
##D                       )
##D layer_param_vector <- list(test_points=list(color = "red",
##D                                               stroke = FALSE,
##D                                               fillOpacity = 0.5),
##D                              county_subdiv=list(color = "grey",
##D                                                 fillOpacity = 0.2)
##D                              )
##D 
##D # Raster base layers to include
##D ras <- rgdal::readGDAL("./temp_data/florida_dem_county099.tif")
##D ras2 <- raster::raster(ras, 1)
##D ras2_leaflet <- leaflet::projectRasterForLeaflet(ras2)
##D explorePgtraj(conn, schema, pgtraj, layer_vector, layer_param_vector,
##D               layer_raster=ras2_leaflet)
## End(Not run)



