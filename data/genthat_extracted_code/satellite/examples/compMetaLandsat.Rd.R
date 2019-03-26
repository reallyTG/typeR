library(satellite)


### Name: compMetaLandsat
### Title: Get calibration information from Landsat 8 standard level 1B/T
###   filename
### Aliases: compMetaLandsat

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
compMetaLandsat(files)




