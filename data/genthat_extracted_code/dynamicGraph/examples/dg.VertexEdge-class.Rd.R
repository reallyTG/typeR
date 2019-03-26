library(dynamicGraph)


### Name: dg.VertexEdge-class
### Title: Class dg.VertexEdge
### Aliases: dg.VertexEdge-class nodeTypesOfEdge,dg.VertexEdge-method
###   oriented<-,dg.VertexEdge-method oriented,dg.VertexEdge-method
###   dg.VertexEdge-class dg.DashedEdge-class dg.DottedEdge-class
###   dg.DoubleArrowEdge-class dg.DoubleConnectedEdge-class
###   dg.TripleConnectedEdge-class newVertexEdge dg.Edge dg.VertexEdge
###   dg.DashedEdge dg.DottedEdge dg.DoubleArrowEdge dg.DoubleConnectedEdge
###   dg.TripleConnectedEdge nodeIndicesOfEdge nodeIndicesOfEdge<-
###   nodeTypesOfEdge width width<- dash dash<- oriented oriented<-
### Keywords: classes

### ** Examples

vertices <- returnVertexList(paste("V", 1:4, sep = ""))
e <- new("dg.VertexEdge", vertex.indices = c(1, 2, 3), 
         vertices = new("dg.VertexList", vertices[1:3]))

str(e)

color(e)
label(e)
labelPosition(e)
width(e)
oriented(e)
nodeIndicesOfEdge(e)
nodeTypesOfEdge(e)

color(e) <- "Black"
label(e) <- "1-2"
labelPosition(e) <- c(10, 20, 30)
width(e) <- 1
oriented(e) <- TRUE
nodeIndicesOfEdge(e) <- c(1, 2)

str(e)



