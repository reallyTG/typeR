library(muHVT)


### Name: plotHVT
### Title: plotHVT
### Aliases: plotHVT
### Keywords: hplot

### ** Examples



data("USArrests",package="datasets")

hvt.results <- list()
hvt.results <- HVT(USArrests, nclust = 3, depth = 3, quant.err = 0.2, 
                  projection.scale = 10, normalize = TRUE)
plotHVT(hvt.results, line.width = c(1.2,0.8,0.4), color.vec = c('#141B41','#0582CA','#8BA0B4'))






