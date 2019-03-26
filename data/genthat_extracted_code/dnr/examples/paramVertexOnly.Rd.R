library(dnr)


### Name: paramVertexOnly
### Title: Parameter estimation for Vertex model only for a list of dynamic
###   networks.
### Aliases: paramVertexOnly

### ** Examples

nvertexstats <- 9
maxLag = 3
VertexLag = rep(1, maxLag)
VertexLagMatrix <- matrix(0, maxLag, nvertexstats)
VertexLagMatrix[, c(4, 7)] <- 1
VertexLagMatrix[c(2,3),7] <- 0
getWeekend <- function(z){
    weekends <- c("Saturday", "Sunday")
    if(!network::is.network(z)){
        if(is.na(z)) return(NA)
    } else {
         zDay <- get.network.attribute(z, attrname = "day")
         out <- ifelse(zDay %in% weekends, 1, 0)
         return(out)   
    }
}

## for(i in 1:31) print(getWeekend(beach[[i]]))
## generate a vector of network level exogenous variable
dayClass <- numeric(length(beach))
for(i in seq_along(dayClass)) {
    dayClass[i] <- getWeekend(beach[[i]])
}
out <- paramVertexOnly(InputNetwork = beach,
                       maxLag = 3,
                       VertexStatsvec = rep(1, nvertexstats),
                       VertexLag = rep(1, maxLag),
                       VertexLagMatrix = VertexLagMatrix,
                       dayClass = dayClass)



