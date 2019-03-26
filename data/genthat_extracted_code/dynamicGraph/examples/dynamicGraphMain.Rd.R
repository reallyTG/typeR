library(dynamicGraph)


### Name: dynamicGraphMain
### Title: Dynamic Graph
### Aliases: dynamicGraphMain dynamicGraph
### Keywords: dplot hplot iplot dynamic graphs methods multivariate

### ** Examples

require(tcltk)
require(dynamicGraph)

V.Names <- paste(c("Sex", "Age", "Eye", "FEV", "Hair", "Shosize"),
                 1:6, sep ="/")

V.Types <- c("Discrete", "Ordinal", "Discrete",
             "Continuous", "Discrete", "Continuous")

Vertices <- returnVertexList(V.Names, types = V.Types, color = "red")

From <- c(1, 2, 3, 4, 5, 6)
To   <- c(2, 3, 4, 5, 6, 1)

EdgeList <- vector("list", length(To))
for (j in seq(along = To)) EdgeList[[j]] <- c(From[j], To[j])
Edges <- returnEdgeList(EdgeList, Vertices, color = "black")

# Z <- dynamicGraphMain(Vertices, edgeList = Edges, control = dg.control(w = 4))

graph <- new("dg.graph", vertexList = Vertices, edgeList = Edges)
W <- dg(graph, control = dg.control(w = 4))



