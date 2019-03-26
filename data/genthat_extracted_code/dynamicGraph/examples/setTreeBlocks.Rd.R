library(dynamicGraph)


### Name: setTreeBlocks
### Title: The block tree
### Aliases: setTreeBlocks Closed Closed<- Parents<- Parents Children<-
###   Children NodeAncestors NodeAncestors<- NodeDescendants
###   NodeDescendants<-
### Keywords: methods dynamic graphs

### ** Examples

# Example 1:

Block.tree <- list(label = "W", Vertices = c("country"),
                   X = list(Vertices = c("race", "sex"),
                            A = list(Vertices = c("hair", "eye"),
                                     horizontal = FALSE),
                            B = list(Vertices = c("education"),
                                     C = list(Vertices = c("age")))))
V.Names <- unlist(Block.tree)
vertices <- returnVertexList(V.Names[grep("Vertices", names(V.Names))])
blocktree <- setTreeBlocks(Block.tree, vertices)

Positions(blockTreeToList(blocktree$BlockTree))
Positions(blocktree$Vertices)
NodeAncestors(blockTreeToList(blocktree$BlockTree))
NodeDescendants(blockTreeToList(blocktree$BlockTree))

vertexStrata <- Strata(blocktree$Vertices)
vertexStrata
vertexNames <- Names(blocktree$Vertices)
names(vertexNames) <- NULL
vertexNames

# Indices of the vertices in blocks:

indicesInBlock <- vector("list", max(vertexStrata))
for (i in seq(along = vertexStrata))
  indicesInBlock[[vertexStrata[i]]] <- 
    append(indicesInBlock[[vertexStrata[i]]], i) 
str(indicesInBlock)

# Names of the vertices in blocks:

vertexNamesInblock <- vector("list", max(vertexStrata))
for (i in seq(along = vertexStrata))
  vertexNamesInblock[[vertexStrata[i]]] <- 
    append(vertexNamesInblock[[vertexStrata[i]]], vertexNames[i]) 
str(vertexNamesInblock)

# A useful function, replace "k" (block index k) 
# in block "i" by "x[k]", the content "x[k]" of block "k":

f <- function(A, x) {
  result <- vector("list", length(A))
  names(result) <- names(A)
  for (i in seq(along = A))
    if ((length(A[[i]]) > 0) && (A[[i]] != 0))
      for (k in A[[i]])
        result[[i]] <- append(result[[i]], x[k])
  return(result)
}

# For each block, names of vertices in ancestor blocks:

vertexAncOfBlock <- f(NodeAncestors(blockTreeToList(blocktree$BlockTree)), 
                      vertexNamesInblock)
str(vertexAncOfBlock)

for (i in seq(along = vertexAncOfBlock))
  if (length(vertexAncOfBlock[[i]]) > 0)
    vertexAncOfBlock[[i]] <- unlist(vertexAncOfBlock[[i]])
str(vertexAncOfBlock)

# For each block, names of vertices in descendant blocks:

vertexDesOfBlock <- f(NodeDescendants(blockTreeToList(blocktree$BlockTree)),
                      vertexNamesInblock)
str(vertexDesOfBlock)

for (i in seq(along = vertexDesOfBlock))
  if (length(vertexDesOfBlock[[i]]) > 0)
    vertexDesOfBlock[[i]] <- unlist(vertexDesOfBlock[[i]])
str(vertexDesOfBlock)


# Example 2:

Block.tree <-
  list(g = 0, G = 54, label = "Pedegree.G",
       Male.Side = 
       list(g = 0, G = 33,
            Father = 
            list(g = 0, G = 12,
                 P.G.Father = list(Vertices = c("P.G.Father.1")),
                 P.G.Mother = list(Vertices = c("P.G.Mother.1")),
                 common.children = list(g = 0, label = "Father.1",
                                        Vertices = c("Father.1"))),
            Mother = 
            list(g = 0, G = 12,
                 M.G.Father = list(Vertices = c("M.G.Father.1")),
                 M.G.Mother = list(Vertices = c("M.G.Mother.1")),
                 common.children = list(g = 0, label = "Mother.1",
                                        Vertices = c("Mother.1"))),
            common.children = list(g = 2, Vertices = c("Male"))),
  Female.Side = list(g = 0, G = 12,
    P.G.Father = list(Vertices = c("P.G.Father.2")),
    P.G.Mother = list(Vertices = c("P.G.Mother.2")),
    M.G.Father = list(Vertices = c("M.G.Father.2")),
    M.G.Mother = list(Vertices = c("M.G.Mother.2")),
    common.children = list(g = 0, G = 12, label = "Female",
      Father = list(Vertices = c("Father.2")),
      Mother = list(Vertices = c("Mother.2")),
      common.children = list(g = 2, Vertices = c("Female")))),
  common.children = list(Vertices = c("Marriage"), g = 3, label = "Children",
    Son = list(Vertices = c("Son"), g = 3, 
       P.G.Son = list(Vertices = c("P.G.Son"), g = 2),
       P.G.Dat = list(Vertices = c("P.G.Dat"), g = 1)),
    Dat = list(Vertices = c("Dat"), g = 2,
       M.G.Son = list(Vertices = c("M.G.Son")),
       M.G.Dat = list(Vertices = c("M.G.Dat")))
    )
)

v <- unlist(Block.tree)
V.Names <- v[grep("Vertices", names(v))]
rm(v)

FromTo <- matrix(c("P.G.Father.1", "Father.1", "P.G.Father.2", "Father.2", 
                   "P.G.Mother.1", "Father.1", "P.G.Mother.2", "Father.2", 
                   "M.G.Father.1", "Mother.1", "M.G.Father.2", "Mother.2", 
                   "M.G.Mother.1", "Mother.1", "M.G.Mother.2", "Mother.2", 
                   "Father.1",     "Male",     "Father.2",     "Female",   
                   "Mother.1",     "Male",     "Mother.2",     "Female",   
                   "Male",         "Marriage", "Female",       "Marriage",
                   "Marriage",     "Son",      "Marriage",     "Dat",
                   "Son",          "P.G.Son",  "Dat",          "M.G.Son", 
                   "Son",          "P.G.Dat",  "Dat",          "M.G.Dat"), 
                   byrow = TRUE, ncol = 2)

From <- match(FromTo[,1], V.Names)
To   <- match(FromTo[,2], V.Names)

V.Types <- rep("Discrete", length(V.Names))

Object <- NULL

graph <- new("dg.simple.graph", vertex.names = V.Names, types = V.Types,
             from = From, to = To, block.tree = Block.tree)

W <- dg(graph,
        control = dg.control(width = 600, height = 600, 
                             drawblocks = TRUE, drawBlockFrame = TRUE, 
                             overlaying = TRUE, title = "Pedegree.G"))



