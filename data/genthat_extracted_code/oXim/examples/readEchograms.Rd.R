library(oXim)


### Name: readEchograms
### Title: Takes outputs from Echopen and generates a matrix to calculate
###   Oxycline.
### Aliases: readEchograms

### ** Examples

fileMode <- list(fish38_file   = system.file("extdata", "fish38.mat", package = "oXim"),
                 fluid120_file = system.file("extdata", "fluid120.mat", package = "oXim"),
                 blue38_file   = system.file("extdata", "blue38.mat", package = "oXim"))
echoData <- readEchograms(fileMode = fileMode)
print(echoData)




