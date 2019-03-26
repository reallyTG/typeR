library(dynamicGraph)


### Name: dg.graph-class
### Title: Class dg.graph
### Aliases: dg.graph-class dg,dg.graph-method addModel,dg.graph-method
###   addView,dg.graph-method replaceModel,dg.graph-method
###   replaceView,dg.graph-method dg addModel addView replaceModel
###   replaceView viewType visibleBlocks visibleVertices edgeList extraList
### Keywords: classes

### ** Examples

from <- c("contry", "contry", "race", "race",       "sex",  "sex")
to   <- c(   "sex",   "race", "hair",  "eye", "education",  "age")
vertexnames <- unique(sort(c(from, to)))
vertices <- returnVertexList(vertexnames)
edge.list <- vector("list", length(to))
for (j in seq(along = to)) edge.list[[j]] <- c(from[j], to[j])
edges <- returnEdgeList(edge.list, vertices, color = "red", oriented = TRUE)

graph <- new("dg.graph", vertexList = vertices, edgeList = edges); str(graph)
dg(graph)



