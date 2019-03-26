library(satellite)


### Name: calcTOAIrradTable
### Title: Get top of atmosphere solar irradiance using readily tabulated
###   values
### Aliases: calcTOAIrradTable calcTOAIrradTable,Satellite-method
###   calcTOAIrradTable,factor-method calcTOAIrradTable,character-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LE07*.TIF"), full.names = TRUE)
sat <- satellite(files)
calcTOAIrradTable(sat)
 
calcTOAIrradTable(x = "LE7", normalize = FALSE, 
                  calcEarthSunDist("2015-01-01"))




