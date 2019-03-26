library(AmigaFFH)


### Name: rasterToIFF
### Title: Convert a grDevices raster image into an IFF formated bitmap
###   image
### Aliases: rasterToIFF

### ** Examples

## Not run: 
##D ## first: Let's make a raster out of the 'volcano' data, which we can use in the example:
##D volcano.raster <- as.raster(t(matrix(terrain.colors(1 + diff(range(volcano)))[volcano -
##D   min(volcano) + 1], nrow(volcano))))
##D 
##D ## Turning the raster into an IFFChunk object is easy:
##D volcano.iff <- rasterToIFF(volcano.raster)
##D 
##D ## This object can be saved as an IFF file using write.iff
## End(Not run)



