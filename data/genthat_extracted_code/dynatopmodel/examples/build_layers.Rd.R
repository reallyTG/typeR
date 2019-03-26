library(dynatopmodel)


### Name: build_layers
### Title: Construct basic landscape layer data for Dynamic TOPMODEL run
### Aliases: build_layers

### ** Examples

## Not run: 
##D require(dynatopmodel)
##D data("brompton")
##D 
##D # Upslope area and wetness index for Brompton catchment
##D layers <- build_layers(brompton$dem)
##D 
##D sp::plot(layers, main=c("Elevation AMSL (m)", "Upslope area (log(m^2/m))", "TWI ((log(m^2/m))"))
## End(Not run)



