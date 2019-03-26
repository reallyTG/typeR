library(sharpshootR)


### Name: polygonAdjacency
### Title: Evaluate Spatial Adjacency of SpaitialPolygonsDataFrame Objects
### Aliases: polygonAdjacency
### Keywords: manip

### ** Examples

## Not run: 
##D library(spdep)
##D library(rgdal)
##D library(igraph)
##D library(sharpshootR)
##D 
##D # load some data
##D x <- readOGR(dsn='L:/CA630/FG_CA630_OFFICIAL.gdb', layer='ca630_a', stringsAsFactors=FALSE)
##D 
##D # remove NOTCOM, DA, and empty (non-NA) symbols
##D x <- x[which(! x$MUSYM ##D 
##D 
##D # compute spatial adjacency summary
##D res <- polygonAdjacency(x, v='MUSYM')
##D 
##D # graphical check: slow for large number of features
##D plot(x)
##D plot(x[res$commonLines, ], col='red', add=TRUE)
##D 
##D # save to SHP
##D writeOGR(x[res$commonLines, ], dsn='.', 
##D layer='common-soil-lines', driver='ESRI Shapefile', 
##D overwrite_layer=TRUE)
##D 
##D # plot spatial adjacency information
##D par(mar=c(0,0,0,0))
##D plotSoilRelationGraph(res$adjMat, 
##D vertex.scaling.factor = 1)
##D plotSoilRelationGraph(res$adjMat, spanning.tree='max', 
##D edge.scaling.factor=0.1, vertex.scaling.factor=1)
## End(Not run)





