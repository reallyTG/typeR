library(dynamicGraph)


### Name: dg.FactorEdge-class
### Title: Class dg.FactorEdge
### Aliases: dg.FactorEdge-class nodeTypesOfEdge,dg.FactorEdge-method
###   newFactorEdge dg.FactorEdge
### Keywords: classes

### ** Examples

vertices   <- returnVertexList(paste("V", 1:4, sep = ""))
factor     <- new("dg.FactorVertex", vertex.indices = 1:3, 
                  vertexList = vertices)
factoredge <- new("dg.FactorEdge", vertex.indices = c(1, -1), 
                  vertices = new("dg.VertexList", list(vertices[[1]], factor)))

str(factoredge)

color(factoredge)
label(factoredge)
labelPosition(factoredge)
width(factoredge)
nodeIndicesOfEdge(factoredge)
nodeTypesOfEdge(factoredge)

color(factoredge) <- "Black"
label(factoredge) <- "V1~V1:2:3"
labelPosition(factoredge) <- c(0, 1, 2)
width(factoredge) <- 1
nodeIndicesOfEdge(factoredge) <- c(1, -1)
str(factoredge)



