library(satellite)


### Name: compFilePathLandsat
### Title: Get filename, bands and metadata file for Landsat 7 and 8
###   standard 1B/T format
### Aliases: compFilePathLandsat sortFilesLandsat

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)

compFilePathLandsat(files)  

sortFilesLandsat(files)
sortFilesLandsat(files, id = TRUE) # indices




