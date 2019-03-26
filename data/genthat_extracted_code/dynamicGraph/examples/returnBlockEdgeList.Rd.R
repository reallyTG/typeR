library(dynamicGraph)


### Name: returnBlockEdgeList
### Title: Class dg.BlockEdgeList: The block edge list
### Aliases: blockEdgeList returnBlockEdgeList dg.BlockEdgeList-class
###   initialize,dg.BlockEdgeList-method
### Keywords: methods dynamic graphs

### ** Examples

Block.tree <- list(label = "W", Vertices = c("country"),
                   X = list(Vertices = c("sex", "race"),
                            A = list(Vertices = c("hair", "eye"),
                                     horizontal = FALSE),
                            B = list(Vertices = c("age"),
                                     C = list(Vertices = c("education")))))
Names <- unlist(Block.tree)
Names <- Names[grep("Vertices", names(Names))]
Types <- rep("Discrete", length(Names))
vertices <- returnVertexList(Names, types = Types)
blocktree <- setTreeBlocks(Block.tree, vertices)
blocks <- blockTreeToList(blocktree$BlockTree)
from <- c("country", "country", "race", "race",       "sex", "sex")
to   <- c(    "sex",    "race", "hair",  "eye", "education", "age")
from <- match(from, Names)
to <- match(to, Names)
edge.list <- vector("list", length(to))
for (j in seq(along = to)) edge.list[[j]] <- c(from[j], to[j])
edges <- returnEdgeList(edge.list, vertices, color = "red", oriented = TRUE)
vertices <- blocktree$Vertices
blockedges <- returnBlockEdgeList(edge.list, vertices, blocks,
                                  color = "red", oriented = TRUE)
blockedges <- new("dg.BlockEdgeList", edge.list = edge.list, 
                                      vertices = vertices, blocks = blocks,
                                      color = "red", oriented = TRUE)

Names(blockedges)
Colors(blockedges)
Labels(blockedges)
LabelPositions(blockedges)
# Positions(blockedges)
# Strata(blockedges)
# Indices(blockedges)
str(NodeTypes(blockedges))
str(NodeIndices(blockedges))
Widths(blockedges)
Oriented(blockedges)
Widths(blockedges) <- rep(1,  7)
Widths(blockedges) <- rep(1, 14)
Widths(blockedges)
asDataFrame(blockedges)



