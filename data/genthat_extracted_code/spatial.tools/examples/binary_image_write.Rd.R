library(spatial.tools)


### Name: binary_image_write
### Title: Writes image data to a flat binary file using col/row/band
###   positioning.
### Aliases: binary_image_write
### Keywords: mmap

### ** Examples

## Not run: 
##D  
##D tahoe_highrez <- brick(system.file("external/tahoe_highrez.tif", package="spatial.tools"))
##D # Create a blank file using create_blank_raster
##D test_blank_file <- create_blank_raster(reference_raster=tahoe_highrez)
##D blank_raster <- brick(test_blank_file)
##D # It should be all 0s:
##D setMinMax(blank_raster)
##D # Write some ones to to the 100th line, columns 25 to 50, bands 1 and 3:
##D data_position <- list(25:50,100,c(1,3))
##D data1s <- array(1,dim=c(
##D 	length(data_position[[1]]),
##D 	length(data_position[[2]]),
##D 	length(data_position[[3]])))
##D plot(raster(test_blank_file,layer=1))
##D binary_image_write(filename=test_blank_file,
##D 	mode=real64(),image_dims=dim(tahoe_highrez),interleave="BSQ",
##D 	data=data1s,data_position=data_position)
##D setMinMax(blank_raster)
##D plot(raster(blank_raster,layer=1))
## End(Not run)



