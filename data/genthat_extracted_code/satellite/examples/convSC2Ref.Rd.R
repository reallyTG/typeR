library(satellite)


### Name: convSC2Ref
### Title: Convert a band's scaled counts or radiance values to reflectance
### Aliases: convSC2Ref convSC2Ref,Satellite-method
###   convSC2Ref,RasterStack-method convSC2Ref,RasterLayer-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)  
sat <- convSC2Ref(sat)

# If you use a raster layer, supply required meta information
bcde <- "B002n"
convSC2Ref(x = getSatDataLayer(sat, bcde),
           mult = getSatRADM(sat, bcde),
           add = getSatRADA(sat, bcde))




