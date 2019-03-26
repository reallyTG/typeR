library(dynamicGraph)


### Name: simpleGraphToGraph
### Title: simple graph to graph
### Aliases: simpleGraphToGraph
### Keywords: dplot hplot iplot dynamic graphs methods multivariate

### ** Examples

require(tcltk); require(dynamicGraph)

control <- dg.control(width = 150, height = 200, margin = 200)

# modelObject <- newDefaultModelObject("AnModelObject")

modelObject <- new("dg.Model", name = "AnModelObject")

V.Types <- c("Discrete", "Ordinal", "Discrete",
             "Continuous", "Discrete", "Continuous")

V.Names <- c("Sex", "Age", "Eye", "FEV", "Hair", "Shosize")
V.Labels <- paste(V.Names, 1:6, sep ="/")

From <- c(1, 2, 3)
To   <- c(2, 3, 1)

simpleGraphZ.1 <- new("dg.simple.graph", vertex.names = V.Names[1:3], 
                      labels = V.Labels[1:3], types = V.Types[1:3], 
                      from = From, to = To)
graphZ.1 <- simpleGraphToGraph(simpleGraphZ.1)

Z.0 <- dg(simpleGraphZ.1, modelObject = modelObject, 
          control = control, title = "Z")

Z.00 <- wDG(sdg = simpleGraphZ.1, object = modelObject, 
            control = control, title = "Z")

Z <- dg(graphZ.1, modelObject = modelObject, control = control, title = "Z")

From <- c(2, 3)
To   <- c(3, 1)

simpleGraphW.1 <- new("dg.simple.graph", from = From, to = To)
graphW.1 <- simpleGraphToGraph(simpleGraphW.1,
                               vertexList = graphZ.1@vertexList,
                               blockList = graphZ.1@blockList)

W <- addModel(graphW.1, frameModels = Z)


simpleGraphV.1 <- new("dg.simple.graph", from = From, to = To)
graphV.1 <- simpleGraphToGraph(simpleGraphV.1,
                               Vertices = graphZ.1@vertexList,
                               BlockList = graphZ.1@blockList)

V <- addView(graphV.1, frameModels = Z, modelIndex = 1, viewType = "Factor")


From <- 1
To   <- 2

simpleGraphU.1 <- new("dg.simple.graph", from = From, to = To)
graphU.1 <- simpleGraphToGraph(simpleGraphU.1)

graphU.1 <- simpleGraphToGraph(simpleGraphU.1,
                               Vertices = graphZ.1@vertexList,
                               BlockList = graphZ.1@blockList)

graphU.1 <- simpleGraphToGraph(simpleGraphU.1,
                               vertexList = graphZ.1@vertexList,
                               blockList = graphZ.1@blockList)

graphU.1 <- simpleGraphToGraph(from = From, to = To,
                               vertexList = graphZ.1@vertexList,
                               blockList = graphZ.1@blockList)

U <- replaceModel(graphU.1, 
                  frameModels = Z, modelIndex = 1, graphIndex = 1, 
                  title = "U")




