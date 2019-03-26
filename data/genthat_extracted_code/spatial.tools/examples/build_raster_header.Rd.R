library(spatial.tools)


### Name: build_raster_header
### Title: Builds a raster header for a flat binary file.
### Aliases: build_raster_header

### ** Examples

## Not run: 
##D  
##D tahoe_highrez <- brick(system.file("external/tahoe_highrez.tif", package="spatial.tools"))
##D test_blank_file <- create_blank_raster(filename=paste(tempfile(),".gri",sep=""),
##D 	reference_raster=tahoe_highrez,nlayers=2,
##D 	create_header=FALSE,format="raster",datatype="FLT8S",bandorder="BSQ")
##D test_blank_raster <- build_raster_header(x_filename=test_blank_file,
##D 	reference_raster=tahoe_highrez,out_nlayers=2,
##D 	datatype='FLT8S',format='raster',bandorder="BSQ",setMinMax=TRUE)
##D test_blank_raster
## End(Not run)



