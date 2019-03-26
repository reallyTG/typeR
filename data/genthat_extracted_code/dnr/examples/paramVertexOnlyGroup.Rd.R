library(dnr)


### Name: paramVertexOnlyGroup
### Title: Parameter estimation for Vertex model only for a list of dynamic
###   networks.
### Aliases: paramVertexOnlyGroup

### ** Examples

nvertexstats <- 9
InputNetwork <- beach
maxLag <- 3
VertexStatsvec <- rep(1, nvertexstats)
VertexLag <- rep(1, maxLag)
regMethod <- "bayesglm"
VertexModelGroup <- "regular"
VertexLagMatrix <- matrix(0, maxLag, nvertexstats)
VertexLagMatrix[, c(4, 7)] <- 1
VertexLagMatrix[c(2,3),7] <- 0
Vout1 <- paramVertexOnlyGroup(InputNetwork = beach,
                          maxLag = maxLag,
                          VertexStatsvec = VertexStatsvec,
                          VertexModelGroup = VertexModelGroup,
                          VertexLag = VertexLag,
                          VertexLagMatrix = VertexLagMatrix)
summary(Vout1$VertexFit$fit)



