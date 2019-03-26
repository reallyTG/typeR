library(dynamicGraph)


### Name: blockTreeToList
### Title: Extract the list of blocks from a block tree
### Aliases: blockTreeToList
### Keywords: methods dynamic graphs

### ** Examples

Block.tree <- list(label = "W", Vertices = c("contry"),
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
blocklist <- blockTreeToList(blocktree$BlockTree)
Labels(blocklist)
str(Parents(blocklist))
str(Children(blocklist))
str(NodeAncestors(blocklist))
str(NodeDescendants(blocklist))
parent(blocklist[[5]])
children(blocklist[[1]])
ancestors(blocklist[[5]])
descendants(blocklist[[1]])
parent(blocklist[[3]]) <- 4
children(blocklist[[2]])
checkBlockList(blocklist)



