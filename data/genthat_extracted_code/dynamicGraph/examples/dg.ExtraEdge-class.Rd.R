library(dynamicGraph)


### Name: dg.ExtraEdge-class
### Title: Class dg.ExtraEdge
### Aliases: dg.ExtraEdge-class nodeTypesOfEdge,dg.ExtraEdge-method
###   newExtraEdge dg.ExtraEdge
### Keywords: classes

### ** Examples

vertices  <- returnVertexList(paste("V", 1:4, sep = ""))
extra     <- returnVertexList(paste("E", 1:4, sep = ""))
extraedge <- new("dg.ExtraEdge", vertex.indices = c(3, -2), 
                 vertices = new("dg.VertexList", 
                                c(vertices[3], extra[2])))

str(extraedge)

color(extraedge)
label(extraedge)
labelPosition(extraedge)
width(extraedge)
nodeIndicesOfEdge(extraedge)
nodeTypesOfEdge(extraedge)

color(extraedge) <- "Black"
label(extraedge) <- "Gryf"
labelPosition(extraedge) <- c(0, 1, 2)
width(extraedge) <- 1
nodeIndicesOfEdge(extraedge) <- c(1, -1)
str(extraedge)



