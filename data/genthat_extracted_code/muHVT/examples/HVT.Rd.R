library(muHVT)


### Name: HVT
### Title: Constructing Hierarchical Voronoi Tessellations
### Aliases: HVT
### Keywords: hplot

### ** Examples

data(USArrests)
hvt.results <- list()
hvt.results <- HVT(USArrests, nclust = 6, depth = 1, quant.err = 0.2, 
                  projection.scale = 10, normalize = TRUE)
plotHVT(hvt.results, line.width = c(0.8), color.vec = c('#141B41'))

hvt.results <- list()
hvt.results <- HVT(USArrests, nclust = 3, depth = 3, quant.err = 0.2, 
                  projection.scale = 10, normalize = TRUE)
plotHVT(hvt.results, line.width = c(1.2,0.8,0.4), color.vec = c('#141B41','#0582CA','#8BA0B4'))



