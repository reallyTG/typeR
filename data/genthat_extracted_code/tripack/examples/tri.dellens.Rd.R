library(tripack)


### Name: tri.dellens
### Title: Compute the Delaunay segment lengths
### Aliases: tri.dellens
### Keywords: spatial

### ** Examples

data(tritest)
tritest.vm <- voronoi.mosaic(tritest$x,tritest$y)

tritest.vm.rejects <- voronoi.findrejectsites(tritest.vm, 0,1, 0, 1)
trilens.all <- tri.dellens(tritest.vm)
trilens.acc <- tri.dellens(tritest.vm, tritest.vm.rejects)
trilens.rej <- tri.dellens(tritest.vm, tritest.vm.rejects, inverse=TRUE)

par(mfrow=c(3,1))
dotchart(trilens.all, main="all Delaunay segment lengths")
dotchart(trilens.acc, main="excluding border sites")
dotchart(trilens.rej, main="only border sites")



