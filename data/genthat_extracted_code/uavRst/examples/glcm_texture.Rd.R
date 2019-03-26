library(uavRst)


### Name: glcm_texture
### Title: Calls the glcm package with useful settings
### Aliases: glcm_texture

### ** Examples


require(glcm)
## example on how to calculate texture with glcm
owd <- getwd()
setwd(tempdir())
data("pacman")
# call glcm wrapper
result <- glcm_texture(pacman,
                       nrasters=1:3,
                       stats=c("mean", "variance", "homogeneity"),
                       parallel = FALSE)

#plot the result:
raster::plot(result[[1]])
setwd(owd)



