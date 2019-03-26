library(homals)


### Name: plot.homals
### Title: Plot methods for homals
### Aliases: plot.homals plot3dstatic plot3dstatic.homals plot3d.homals
### Keywords: hplot

### ** Examples


##Graphplot for Hartigan solution: 3 dimensions extracted, dimension 1 plotted
##against dimension 3.
data(hartigan)
res <- homals(hartigan, ndim = 3)
plot(res, plot.dim = c(1,3), plot.type = "graphplot")



