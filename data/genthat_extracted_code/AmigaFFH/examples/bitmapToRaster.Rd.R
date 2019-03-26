library(AmigaFFH)


### Name: bitmapToRaster
### Title: Convert an Amiga bitmap image into a raster
### Aliases: bitmapToRaster

### ** Examples

## Not run: 
##D ## first load an example image:
##D example.iff <- read.iff(system.file("ilbm8lores.iff", package = "AmigaFFH"))
##D 
##D ## get the raw bitmap data, which is nested in the InterLeaved BitMap (ILBM)
##D ## IFF chunk as the BODY:
##D bitmap.data <- interpretIFFChunk(getIFFChunk(example.iff, c("ILBM", "BODY")))
##D 
##D ## In order to translate the bitmap data into a raster object we need
##D ## to know the image dimensions (width, height and colour depth). This
##D ## information can be obtained from the bitmap header (BMHD):
##D 
##D bitmap.header <- interpretIFFChunk(getIFFChunk(example.iff, c("ILBM", "BMHD")))
##D 
##D ## First the bitmap data needs to be unpacked as it was stored in a compresssed
##D ## form in the IFF file (see bitmap.header$Compression):
##D 
##D bitmap.data <- unPackBitmap(bitmap.data)
##D 
##D ## It would also be nice to use the correct colour palette. This can be obtained
##D ## from the CMAP chunk in the IFF file:
##D 
##D bitmap.palette <- interpretIFFChunk(getIFFChunk(example.iff, c("ILBM", "CMAP")))
##D 
##D example.raster <- bitmapToRaster(bitmap.data,
##D                                  bitmap.header$w,
##D                                  bitmap.header$h,
##D                                  bitmap.header$nPlanes,
##D                                  bitmap.palette)
##D 
##D ## We now have a raster object that can be plotted:
##D 
##D plot(example.raster, interpolate = FALSE)
## End(Not run)



