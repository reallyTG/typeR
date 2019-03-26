library(satellite)


### Name: convRad2Ref
### Title: Convert a band's scaled counts or radiance values to reflectance
### Aliases: convRad2Ref convRad2Ref,Satellite-method
###   convRad2Ref,RasterStack-method convRad2Ref,RasterLayer-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)  
sat <- convRad2Ref(sat)

# If you use a raster layer, supply required meta information
bcde <- "B002n"
convRad2Ref(x = getSatDataLayer(sat, bcde),
            mult = getSatRADM(sat, bcde),
            add = getSatRADA(sat, bcde))




