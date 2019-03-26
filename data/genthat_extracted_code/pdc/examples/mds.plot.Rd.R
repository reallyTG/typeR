library(pdc)


### Name: mdsPlot
### Title: Multidimensional Scaling Plot
### Aliases: mds.plot mdsPlot

### ** Examples

data("complex.shapes")
truth <- c(rep("fish",5),rep("bottle",4),rep("glasses",5))
clust <- pdclust(complex.shapes, t=5)
mdsPlot(clust, truth, col=c("lightblue","lightgreen","lightgray"))



