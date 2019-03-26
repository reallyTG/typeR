library(oXim)


### Name: echogramPlot.default
### Title: Plot a matrix of a filtered echogram.
### Aliases: echogramPlot.default echogramPlot echogramPlot.matrix

### ** Examples

fileMode <- list(fish38_file   = system.file("extdata", "fish38.mat", package = "oXim"),
                 fluid120_file = system.file("extdata", "fluid120.mat", package = "oXim"),
                 blue38_file   = system.file("extdata", "blue38.mat", package = "oXim"))
echoData <- readEchograms(fileMode = fileMode)
echogramPlot(x = echoData)



