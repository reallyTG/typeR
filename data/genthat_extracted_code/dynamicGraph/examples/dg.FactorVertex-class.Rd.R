library(dynamicGraph)


### Name: dg.FactorVertex-class
### Title: Class dg.FactorVertex
### Aliases: dg.FactorVertex-class fixed.positions<-,dg.FactorVertex-method
###   fixed.positions,dg.FactorVertex-method
###   nodeIndices<-,dg.FactorVertex-method
###   nodeIndices,dg.FactorVertex-method initialize,dg.FactorVertex-method
###   index<-,dg.FactorVertex-method index,dg.FactorVertex-method newFactor
###   dg.FactorVertex nodeIndices nodeIndices<-
### Keywords: classes

### ** Examples

vertices       <- returnVertexList(paste("V", 1:4, sep = ""), 
                                   types = rep("Discrete", 4))
vertex.indices <- c(1, 2, 3)
vertices       <- new("dg.VertexList", vertices[c(1, 2, 3)])
name           <- paste(Labels(vertices), collapse = ":")

factor <- new("dg.Generator", vertex.indices = vertex.indices,
              position = apply(Positions(vertices), 2, mean),
              index = 0, color = "yellow", name = name, label = name)

factor <- new("dg.FactorVertex", vertex.indices = 1:3, vertices = vertices)

factor <- new("dg.FactorVertex", vertex.indices = 1:3, vertexList = vertices)

str(factor)

color(factor)
label(factor)
labelPosition(factor)
name(factor)
index(factor)
position(factor)
nodeIndices(factor)

color(factor) <- "green"
label(factor) <- "v-1-2-3"
labelPosition(factor) <- c(1, 2, 3)
name(factor) <- "V-123" 
index(factor) <- 3
position(factor) <- c( 10,  20,  30,  40)

str(factor)



