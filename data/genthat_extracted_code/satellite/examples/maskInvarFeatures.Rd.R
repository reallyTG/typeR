library(satellite)


### Name: maskInvarFeatures
### Title: Identify pseudo-invariant features from a satellite scene
### Aliases: maskInvarFeatures maskInvarFeatures,Satellite-method
###   maskInvarFeatures,RasterStack-method
###   maskInvarFeatures,RasterLayer-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)
sat <- maskInvarFeatures(sat)

maskInvarFeatures(x = getSatDataLayer(sat, "B004n"), 
                  nir = getSatDataLayer(sat, "B005n"), 
                  swir = getSatDataLayer(sat, "B007n"))

## when dealing with a 'RasterStack'
rst <- stack(files[c(6, 7, 9)])
maskInvarFeatures(rst)




