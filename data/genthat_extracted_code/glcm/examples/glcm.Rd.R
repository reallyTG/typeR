library(glcm)


### Name: glcm
### Title: Image texture measures from grey-level co-occurrence matrices
###   (GLCM)
### Aliases: glcm

### ** Examples

## Not run: 
##D require(raster)
##D # Calculate GLCM textures using default 90 degree shift
##D textures_shift1 <- glcm(raster(L5TSR_1986, layer=1))
##D plot(textures_shift1)
##D 
##D # Calculate GLCM textures over all directions
##D textures_all_dir <- glcm(raster(L5TSR_1986, layer=1),
##D                          shift=list(c(0,1), c(1,1), c(1,0), c(1,-1)))
##D plot(textures_all_dir)
## End(Not run)



