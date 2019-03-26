library(pdc)


### Name: rasterPlot
### Title: Dendrogram Plot with Images
### Aliases: rasterPlot

### ** Examples

data("complex.shapes")
data("complex.shapes.raw")
clust <- pdclust(complex.shapes, t=5)
rasterPlot(clust, complex.shapes.raw$images)



