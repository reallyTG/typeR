library(tripack)


### Name: cells
### Title: extract info about voronoi cells
### Aliases: cells
### Keywords: spatial

### ** Examples

data(tritest)
tritest.vm <- voronoi.mosaic(tritest$x,tritest$y)
tritest.cells <- cells(tritest.vm)
# higlight cell 12:
plot(tritest.vm)
polygon(t(tritest.cells[[12]]$nodes),col="green")
# put cell area into cell center:
text(tritest.cells[[12]]$center[1],
     tritest.cells[[12]]$center[2],
     tritest.cells[[12]]$area)



