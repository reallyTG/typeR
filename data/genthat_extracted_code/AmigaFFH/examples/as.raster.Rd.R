library(AmigaFFH)


### Name: as.raster
### Title: Convert AmigaFFH objects into grDevices raster images
### Aliases: as.raster as.raster.hardwareSprite
###   as.raster,hardwareSprite-method as.raster as.raster.IFFChunk
###   as.raster as.raster.AmigaIcon

### ** Examples

## Not run: 
##D ## load an IFF file
##D example.iff <- read.iff(system.file("ilbm8lores.iff", package = "AmigaFFH"))
##D 
##D ## The file contains an interleaved bitmap image that can be
##D ## converted into a raster:
##D example.raster <- as.raster(example.iff)
##D 
##D ## the raster can be plotted:
##D plot(example.raster)
##D 
##D ## note that the IFFChunk can also be plotted directly:
##D plot(example.iff)
##D 
##D ## Hardware sprites can also be converted into raster images.
##D ## Let's generate a 16x16 sprite with a random bitmap:
##D spr <- new("hardwareSprite",
##D            VStop = 16,
##D            bitmap = as.raw(sample.int(255, 64, replace = TRUE)))
##D 
##D ## now convert it into a raster image.
##D ## as the background colour is not specified for hardware
##D ## sprite, we can optionally provide it here.
##D spr.raster <- as.raster(spr, background = "green")
## End(Not run)



