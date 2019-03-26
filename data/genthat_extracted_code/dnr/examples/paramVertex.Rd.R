library(dnr)


### Name: paramVertex
### Title: Parameter estimation for Vertex dynamics
### Aliases: paramVertex

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

dayClass <- numeric(length(beach))
for(i in seq_along(dayClass)) {
    dayClass[i] <- getWeekend(beach[[i]])
}
dayClass <- na.omit(dayClass)


out <- paramVertex(InputNetwork = beach,
                   maxLag = 3,
                   VertexStatsvec = rep(1, nvertexstats),
                   VertexModelGroup = "regular",
                   VertexLag = rep(1, maxLag),
                   VertexLagMatrix = VertexLagMatrix,
                   dayClass = dayClass,
                   EdgeModelTerms = NA,
                   EdgeModelFormula = NA,
                   EdgeGroup = NA,
                   EdgeIntercept = c("edges"),
                   EdgeNetparam = c("logSize"),
                   EdgeExvar = NA,
                   EdgeLag = c(1, 1, 0),
                   paramout = TRUE)



