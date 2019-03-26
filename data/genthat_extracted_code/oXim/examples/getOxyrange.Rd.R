library(oXim)


### Name: getOxyrange
### Title: Takes a matrix of echogram and calculate Oxycline.
### Aliases: getOxyrange

### ** Examples

fileMode <- list(fish38_file   = system.file("extdata", "fish38.mat", package = "oXim"),
                 fluid120_file = system.file("extdata", "fluid120.mat", package = "oXim"),
                 blue38_file   = system.file("extdata", "blue38.mat", package = "oXim"))
echoData <- readEchograms(fileMode = fileMode)
oxyLimits <- getOxyrange(fluidMatrix = echoData)




