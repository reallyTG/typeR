library(dynamicGraph)


### Name: returnEdgeList
### Title: Class dg.VertexEdgeList: The edge list
### Aliases: vertexEdgeList returnEdgeList dg.VertexEdgeList-class
###   initialize,dg.VertexEdgeList-method
### Keywords: methods dynamic graphs

### ** Examples

from <- c("contry", "contry", "race", "race",       "sex",  "sex")
to   <- c(   "sex",   "race", "hair",  "eye", "education",  "age")
vertexnames <- unique(sort(c(from, to)))
vertices <- returnVertexList(vertexnames)
# from <- match(from, vertexnames)
# to <- match(to, vertexnames)
edge.list <- vector("list", length(to))
for (j in seq(along = to)) edge.list[[j]] <- c(from[j], to[j])

edges <- returnEdgeList(edge.list, vertices, color = "red", oriented = TRUE)

edges <- new("dg.VertexEdgeList", edge.list = edge.list,
             vertices = vertices, color = "red", oriented = TRUE)

Names(edges)
Colors(edges)
Labels(edges)
LabelPositions(edges)
# Positions(edges)
# Strata(edges)
# Indices(edges)
str(NodeTypes(edges))
str(NodeIndices(edges))
Dashes(edges)
Widths(edges)
Oriented(edges)
Widths(edges) <- rep(1, 7)
Widths(edges) <- rep(1, 6)
Widths(edges)
asDataFrame(edges)



