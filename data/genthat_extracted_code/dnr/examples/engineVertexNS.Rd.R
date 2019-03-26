library(dnr)


### Name: engineVertexNS
### Title: Simulation Engine for dynamic Vertex case without smoothing of
###   estimated predictor matrices.
### Aliases: engineVertexNS

### ** Examples

## Not run: 
##D nvertexstats <- 9
##D maxLag <- 3
##D VertexLag <- rep(1, maxLag)
##D VertexLagMatrix <- matrix(0, maxLag, nvertexstats)
##D VertexLagMatrix[, c(4, 7)] <- 1
##D VertexLagMatrix[c(2, 3), ] <- 1
##D simResult <- suppressWarnings(engineVertexNS(InputNetwork = beach,
##D                           numSim = 5,
##D                           maxLag = 3,
##D                           VertexStatsvec = rep(1, nvertexstats),
##D                           VertexModelGroup = "regular",
##D                           VertexAttLag = rep(1, maxLag),
##D                           VertexLag = rep(1, maxLag),
##D                           VertexLagMatrix = VertexLagMatrix,
##D                           EdgeModelTerms = NA,
##D                           EdgeModelFormula = NA,
##D                           EdgeGroup = NA,
##D                           EdgeIntercept = c("edges")
##D                           ))
## End(Not run)



