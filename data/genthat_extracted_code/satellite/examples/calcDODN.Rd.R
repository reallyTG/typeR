library(satellite)


### Name: calcDODN
### Title: Compile dark object DN for given sensor band
### Aliases: calcDODN calcDODN,Satellite-method calcDODN,RasterLayer-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)

calcDODN(sat, bcde = "B002n")
calcDODN(getSatDataLayer(sat, bcde = "B002n"))




