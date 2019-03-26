library(dnr)


### Name: engineVertex
### Title: Simulation Engine for dynamic Vertex case.
### Aliases: engineVertex

### ** Examples

## Not run: 
##D nvertexstats <- 9
##D maxLag = 3
##D VertexLag = rep(1, maxLag)
##D VertexLagMatrix <- matrix(0, maxLag, nvertexstats)
##D VertexLagMatrix[, c(4, 7)] <- 1
##D VertexLagMatrix[c(2,3),7] <- 0
##D 
##D getWeekend <- function(z){
##D     weekends <- c("Saturday", "Sunday")
##D     if(!network::is.network(z)){
##D         if(is.na(z)) return(NA)
##D     } else {
##D          zDay <- get.network.attribute(z, attrname = "day")
##D          out <- ifelse(zDay %in% weekends, 1, 0)
##D          return(out)   
##D     }
##D }
##D 
##D dayClass <- numeric(length(beach))
##D for(i in seq_along(dayClass)) {
##D     dayClass[i] <- getWeekend(beach[[i]])
##D }
##D dayClass <- na.omit(dayClass)
##D simResult <- suppressWarnings(engineVertex(InputNetwork = beach,
##D                           numSim = 5,
##D                           maxLag = 3,
##D                           VertexStatsvec = rep(1, nvertexstats),
##D                           VertexModelGroup = "regular",
##D                           VertexAttLag = rep(1, maxLag),
##D                           VertexLag = rep(1, maxLag),
##D                           VertexLagMatrix = VertexLagMatrix,
##D                           dayClassObserved = dayClass,
##D                           dayClassFuture = c(1, 0, 0, 0, 0),
##D                           EdgeModelTerms = NA,
##D                           EdgeModelFormula = NA,
##D                           EdgeGroup = NA,
##D                           EdgeIntercept = c("edges"),
##D                           EdgeNetparam = c("logSize"),
##D                           EdgeExvar = NA,
##D                           EdgeLag = c(0, 1, 0),
##D                           paramout = TRUE
##D                           ))
## End(Not run)




