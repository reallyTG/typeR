library(dynamicGraph)


### Name: dg.BlockEdge-class
### Title: Class dg.BlockEdge
### Aliases: dg.BlockEdge-class nodeTypesOfEdge,dg.BlockEdge-method
###   oriented<-,dg.BlockEdge-method oriented,dg.BlockEdge-method
###   newBlockEdge newBlockEdge dg.BlockEdge
### Keywords: classes

### ** Examples
 
vertices  <- returnVertexList(paste("V", 1:4, sep = ""))
block     <- new("dg.Block", stratum = 1)
blockedge <- new("dg.BlockEdge", vertex.indices = c(4, -1), 
                 vertices = new("dg.VertexList", list(vertices[[1]], block)))

str(blockedge)

color(blockedge)
label(blockedge)
labelPosition(blockedge)
width(blockedge)
nodeIndicesOfEdge(blockedge)
nodeTypesOfEdge(blockedge)

color(blockedge) <- "Black"
label(blockedge) <- "V1~1"
labelPosition(blockedge) <- c(0, 1, 2)
width(blockedge) <- 1
nodeIndicesOfEdge(blockedge) <- c(1, -1)

str(blockedge)



