library(satellite)


### Name: calcTOAIrradRadRef
### Title: Compute top of atmosphere solar irradiance using radiation vs.
###   reflection
### Aliases: calcTOAIrradRadRef calcTOAIrradRadRef,Satellite-method
###   calcTOAIrradRadRef,numeric-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)  
sat <- calcTOAIrradModel(sat)
getSatESUN(sat)

calcTOAIrradRadRef(x = getSatRadMax(sat, getSatBCDESolar(sat)), 
                   ref_max = getSatRefMax(sat, getSatBCDESolar(sat)), 
                   normalize = FALSE, 
                   esd = calcEarthSunDist("2015-01-01"))
                   



