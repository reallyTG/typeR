library(satellite)


### Name: calcTOAIrradModel
### Title: Compute top of atmosphere solar irradiance for sensor bands
###   using LUTs
### Aliases: calcTOAIrradModel calcTOAIrradModel,Satellite-method
###   calcTOAIrradModel,data.frame-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)
sat <- calcTOAIrradModel(sat)
getSatESUN(sat)

lut <- lutInfo()
calcTOAIrradModel(lut$L8_RSR, model = "MNewKur", normalize = FALSE, 
  esd = calcEarthSunDist("2015-01-01"))




