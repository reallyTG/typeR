library(AmigaFFH)


### Name: rasterToHWSprite
### Title: Convert a raster object into an hardwareSprite object
### Aliases: rasterToHWSprite

### ** Examples

## Not run: 
##D ## first create a raster object that can be used as input
##D ## (making sure that the background is transparent):
##D rst <- as.raster(simpleSysConfig()$PointerMatrix, "#AAAAAA00")
##D 
##D ## now turn it into a hardware sprite:
##D spr <- rasterToHWSprite(rst)
##D 
##D ## and plot it as a check:
##D plot(spr)
## End(Not run)



