library(satellite)


### Name: convSC2Rad
### Title: Convert a band's scaled counts to radiance
### Aliases: convSC2Rad convSC2Rad,Satellite-method
###   convSC2Rad,RasterStack-method convSC2Rad,RasterLayer-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)  
sat <- convSC2Rad(sat)

# If you use a raster layer, supply required meta information
bcde <- "B002n"
convSC2Rad(x = getSatDataLayer(sat, bcde),
           mult = getSatRADM(sat, bcde),
           add = getSatRADA(sat, bcde))




