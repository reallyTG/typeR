library(spatial.tools)


### Name: create_blank_raster
### Title: Create an empty raster and header.
### Aliases: create_blank_raster

### ** Examples

## Not run: 
##D  
##D tahoe_highrez <- brick(system.file("external/tahoe_highrez.tif", package="spatial.tools"))
##D test_blank_file <- create_blank_raster(reference_raster=tahoe_highrez)
##D file.info(test_blank_file)
##D test_blank_raster <- create_blank_raster(reference_raster=tahoe_highrez,return_filename=FALSE)
##D test_blank_raster
## End(Not run)



