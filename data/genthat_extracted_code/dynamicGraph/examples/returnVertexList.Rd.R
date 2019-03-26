library(dynamicGraph)


### Name: returnVertexList
### Title: Class dg.VertexList: The vertex list
### Aliases: vertexList returnVertexList dg.VertexList-class
###   initialize,dg.VertexList-method
### Keywords: methods dynamic graphs

### ** Examples

vertices <- returnVertexList(c("A", "B", "C", "D"),
                             labels = c("OrdinalVertex", "TextVertex", 
                               "ContinuousVertex", "DiscreteVertex"), 
                             types = c("Ordinal", "TextVertex",
                                       "Continuous", "Discrete"), N = 2)

vertices <- new("dg.VertexList", names = c("A", "B", "C", "D"),
                             labels = c("OrdinalVertex", "TextVertex", 
                               "ContinuousVertex", "DiscreteVertex"), 
                             types = c("Ordinal", "TextVertex",
                                       "Continuous", "Discrete"), N = 2)
Names(vertices)
Colors(vertices)
Labels(vertices)
LabelPositions(vertices)
Positions(vertices)
Strata(vertices)
Indices(vertices)
Names(vertices) <- c("a", "b", "c", "d")
Colors(vertices) <- rep("Blue", 4)
Labels(vertices) <- c("A", "B", "C", "D")
LabelPositions(vertices) <- matrix(rep(0, 12), ncol = 3)
Positions(vertices) <- matrix(rep(0, 12), ncol = 3)
Strata(vertices) <- rep(1, 4)
Names(vertices)
Colors(vertices)
Labels(vertices)
LabelPositions(vertices)
Positions(vertices)
Strata(vertices)
Indices(vertices)
asDataFrame(vertices)



