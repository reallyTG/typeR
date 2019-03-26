library(mvQuad)


### Name: plot (plot.NIGrid)
### Title: plots an NIGrid-object
### Aliases: 'plot (plot.NIGrid)' plot.NIGrid

### ** Examples

myGrid <- createNIGrid(dim=4, type=c("GHe", "cNC1", "GLe", "oNC1"),
                       level=c(3,4,5,6))
plot(myGrid) ## dimension 1-min(3,dim(myGrid)) are plotted
## Free arranged plots
plot(myGrid, plot.dimension=c(4,2,1))
plot(myGrid, plot.dimension=c(1,2))
plot(myGrid, plot.dimension=c(3))



