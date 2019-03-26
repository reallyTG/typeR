library(AmigaFFH)


### Name: dither
### Title: Image dithering
### Aliases: dither dither dither.raster dither dither.matrix

### ** Examples

## Not run: 
##D ## first: Let's make a raster out of the 'volcano' data, which we can use in the example:
##D volcano.raster <- as.raster(t(matrix(terrain.colors(1 + diff(range(volcano)))[volcano -
##D   min(volcano) + 1], nrow(volcano))))
##D 
##D ## let's dither the image, using a predefined two colour palette:
##D volcano.dither <- dither(volcano.raster,
##D                          method = "floyd-steinberg",
##D                          palette = c("yellow", "green"))
##D 
##D ## Convert the indices back into a raster object, such that we can plot it:
##D volcano.dither <- as.raster(apply(volcano.dither, 2, function(x) c("yellow", "green")[x]))
##D par(mfcol = c(1, 2))
##D plot(volcano.raster, interpolate = F)
##D plot(volcano.dither, interpolate = F)
##D 
##D ## results will get better when a better matching colour palette is used.
##D ## for that purpose use the function 'index.colours'.
## End(Not run)



