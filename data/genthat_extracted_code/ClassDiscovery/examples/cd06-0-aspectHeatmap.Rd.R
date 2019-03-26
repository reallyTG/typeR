library(ClassDiscovery)


### Name: aspectHeatmap
### Title: Heatmap with control over the aspect ratio
### Aliases: aspectHeatmap
### Keywords: hplot

### ** Examples

nC <- 30
nR <- 1000
fakeData <- matrix(rnorm(nC*nR), ncol=nC, nrow=nR)
aspectHeatmap(fakeData, scale='none', hExp=2, wExp=1.4, margins=c(6,3))
aspectHeatmap(fakeData, scale='none', hExp=2, wExp=1.4, margins=c(6,3),
              vlines=15.5, hlines=c(100, 300))



