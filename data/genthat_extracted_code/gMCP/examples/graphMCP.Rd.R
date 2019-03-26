library(gMCP)


### Name: graphMCP-class
### Title: Class graphMCP
### Aliases: graphMCP-class graphMCP print,graphMCP-method
###   plot,graphMCP,ANY-method getWeights getWeights,graphMCP-method
###   getMatrix getMatrix,graphMCP-method setWeights
###   setWeights,graphMCP-method setRejected<-
###   setRejected<-,graphMCP-method getRejected getRejected,graphMCP-method
###   getXCoordinates getXCoordinates,graphMCP-method getYCoordinates
###   getYCoordinates,graphMCP-method setEdge
###   setEdge,character,character,graphMCP,character-method
###   setEdge,character,character,graphMCP,numeric-method getNodes
###   getNodes,graphMCP-method edgeAttr edgeAttr<-
###   edgeAttr,graphMCP,character,character,character-method
###   edgeAttr<-,graphMCP,character,character,character-method nodeAttr
###   nodeAttr<- nodeAttr,graphMCP,character,character-method
###   nodeAttr<-,graphMCP,character,character-method
### Keywords: graphs

### ** Examples


m <- rbind(H11=c(0,   0.5, 0,   0.5, 0,   0  ),
			H21=c(1/3, 0,   1/3, 0,   1/3, 0  ),
			H31=c(0,   0.5, 0,   0,   0,   0.5),
			H12=c(0,   1,   0,   0,   0,   0  ),
			H22=c(0.5, 0,   0.5, 0,   0,   0  ),
			H32=c(0,   1,   0,   0,   0,   0  ))	

weights <- c(1/3, 1/3, 1/3, 0, 0, 0)

# Graph creation
graph <- new("graphMCP", m=m, weights=weights)

# Visualization settings
nodeX <- rep(c(100, 300, 500), 2)
nodeY <- rep(c(100, 300), each=3)
graph@nodeAttr$X <- nodeX
graph@nodeAttr$Y <- nodeY	

getWeights(graph)

getRejected(graph)

pvalues <- c(0.1, 0.008, 0.005, 0.15, 0.04, 0.006)
result <- gMCP(graph, pvalues)

getWeights(result@graphs[[4]])
getRejected(result@graphs[[4]])




