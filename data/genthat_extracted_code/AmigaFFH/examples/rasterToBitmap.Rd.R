library(AmigaFFH)


### Name: rasterToBitmap
### Title: Convert a grDevices 'raster' object into binary bitmap data
### Aliases: rasterToBitmap

### ** Examples

## Not run: 
##D ## first: Let's make a raster out of the 'volcano' data, which we can use in the example:
##D volcano.raster <- as.raster(t(matrix(terrain.colors(1 + diff(range(volcano)))[volcano -
##D   min(volcano) + 1], nrow(volcano))))
##D 
##D ## convert the raster into binary (logical) bitmap data:
##D volcano.bm <- rasterToBitmap(volcano.raster)
##D 
##D ## The palette for the indexed colours of the generated bitmap is returned as
##D ## attribute. There is no transparency is the image:
##D attributes(volcano.bm)
##D 
##D ## We can also include a custom function for colour quantisation. Let's include
##D ## some dithering:
##D volcano.dither <- rasterToBitmap(volcano.raster,
##D                                  indexing = function(x, length.out) {
##D                                    index.colours(x, length.out,
##D                                                  dither = "floyd-steinberg")
##D                                  })
##D 
##D ## You can also use a custom indexing function to force a specified palette,
##D ## in this case black and white:
##D volcano.bw <- rasterToBitmap(volcano.raster,
##D                              indexing = function(x, length.out) {
##D                                index.colours(x, length.out,
##D                                              palette = c("black", "white"),
##D                                              dither = "floyd-steinberg")
##D                              })
##D 
## End(Not run)



