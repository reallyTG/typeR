library(oce)


### Name: download.topo
### Title: Download and Cache a topo File
### Aliases: download.topo

### ** Examples

## Not run: 
##D library(oce)
##D topoFile <- download.topo(west=-64, east=-60, south=43, north=46,
##D                           resolution=1, destdir="~/data/topo")
##D topo <- read.topo(topoFile)
##D imagep(topo, zlim=c(-400, 400), drawTriangles=TRUE)
##D data(coastlineWorldFine, package="ocedata")
##D lines(coastlineWorldFine[["longitude"]], coastlineWorldFine[["latitude"]])
## End(Not run)




