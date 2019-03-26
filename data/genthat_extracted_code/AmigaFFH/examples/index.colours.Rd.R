library(AmigaFFH)


### Name: index.colours
### Title: Quantisation of colours and indexing a grDevices raster image
### Aliases: index.colours

### ** Examples

## Not run: 
##D ## first: Let's make a raster out of the 'volcano' data, which we can use in the example:
##D volcano.raster <- as.raster(t(matrix(terrain.colors(1 + diff(range(volcano)))[volcano -
##D   min(volcano) + 1], nrow(volcano))))
##D 
##D ## This will create an image of the original raster using an indexed palette:
##D volcano.index <- index.colours(volcano.raster)
##D 
##D ## The index values can be converted back into colours, using the palette:
##D volcano.index <- as.raster(apply(volcano.index, 2,
##D                                  function(x) attributes(volcano.index)$palette[x]))
##D 
##D ## Create an indexed image using dithering
##D volcano.dith <- index.colours(volcano.raster, dither = "floyd-steinberg")
##D volcano.dith <- as.raster(apply(volcano.dith, 2,
##D                                 function(x) attributes(volcano.dith)$palette[x]))
##D 
##D ## plot the images side by side for comparison
##D par(mfcol = c(1, 3))
##D plot(volcano.raster, interpolate = F)
##D plot(volcano.index, interpolate = F)
##D plot(volcano.dith, interpolate = F)
## End(Not run)



