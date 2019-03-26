library(gMCP)


### Name: entangledMCP-class
### Title: Class entangledMCP
### Aliases: entangledMCP-class entangledMCP print,entangledMCP-method
###   getWeights,entangledMCP-method getMatrices
###   getMatrices,entangledMCP-method getRejected,entangledMCP-method
###   getXCoordinates,entangledMCP-method
###   getYCoordinates,entangledMCP-method getNodes,entangledMCP-method
### Keywords: graphs

### ** Examples


g1 <- BonferroniHolm(2)
g2 <- BonferroniHolm(2)

graph <- new("entangledMCP", subgraphs=list(g1,g2), weights=c(0.5,0.5))

getMatrices(graph)
getWeights(graph)




