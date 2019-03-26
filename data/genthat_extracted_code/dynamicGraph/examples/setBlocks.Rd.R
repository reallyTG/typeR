library(dynamicGraph)


### Name: setBlocks
### Title: Class dg.BlockList: The block list
### Aliases: setBlocks blockList dg.BlockList-class ancestorsBlockList
###   checkBlockList descendantsBlockList
###   ancestorsBlockList,dg.BlockList-method
###   checkBlockList,dg.BlockList-method
###   descendantsBlockList,dg.BlockList-method
### Keywords: methods dynamic graphs

### ** Examples

require(tcltk)

require(dynamicGraph)

V.Types <- c("Discrete", "Ordinal", "Discrete",
             "Continuous", "Discrete", "Continuous")

V.Names <- c("Sex", "Age", "Eye", "FEV", "Hair", "Shosize")
V.Names <- paste(V.Names, 1:6, sep ="/")

From <- c(1, 2, 3, 4, 5, 6)
To   <- c(2, 3, 4, 5, 6, 1)

# A block recursive model:

Blocks <- list(Basic = c(2, 1), Intermediate = c(5, 4, 3),  Now = c(6))

V.Names <- paste(V.Names, c(1, 1, 2, 2, 2, 3), sep =":")

graph <- new("dg.simple.graph", vertex.names = V.Names, types = V.Types,
             from = From, to = To, blocks = Blocks)

W <- dg(graph,
        control = dg.control(width = 600, height = 600, drawblocks = TRUE,
                             drawBlockBackground = FALSE, title = "DrawBlocks", 
                             namesOnEdges = FALSE))

# A block recursiv model, without drawing blocks:

W <- dg(simpleGraphToGraph(graph, control = dg.control(drawblocks = FALSE)),
        control = dg.control(width = 600, height = 600, title = "No blocks drawn"))

# A block recursive model with nested blocks:

W <- dg(simpleGraphToGraph(graph, 
          control = dg.control(nested.blocks = TRUE,
                               blockColors = 
                               paste("Grey", 100 - 2 * (1:10), sep = ""))),
        control = dg.control(width = 600, height = 600, title = "Nested blocks"))

# The block list of the last example:

vertices <- returnVertexList(V.Names, types = V.Types)
blockList <- setBlocks(Blocks, vertices = vertices,  nested.blocks = TRUE,
                       blockColors = paste("Grey", 100 - 2 * (1:10), sep = ""))

names(blockList)
str(blockList$Blocks[[1]])

names(blockList$Blocks)
Names(blockList$Blocks)
Labels(blockList$Blocks)
LabelPositions(blockList$Blocks)
Positions(blockList$Blocks)
Strata(blockList$Blocks)
Colors(blockList$Blocks)
NodeAncestors(blockList$Blocks)
NodeDescendants(blockList$Blocks)
Visible(blockList$Blocks)
Indices(blockList$Blocks)

names(blockList$Vertices)
Names(blockList$Vertices)
Labels(blockList$Vertices)
LabelPositions(blockList$Vertices)
Positions(blockList$Vertices)
Strata(blockList$Vertices)
Colors(blockList$Vertices)
Indices(blockList$Vertices)

asDataFrame(blockList$Vertices)
asDataFrame(blockList$Blocks)




