library(satellite)


### Name: convRad2BT
### Title: Convert a band's scaled counts to brightness temperature
### Aliases: convRad2BT convRad2BT,Satellite-method
###   convRad2BT,RasterStack-method convRad2BT,RasterLayer-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)  
sat <- convRad2BT(sat)




