library(redist)


### Name: redist.rsg
### Title: Redistricting via Random Seed and Grow Algorithm
### Aliases: redist.rsg

### ** Examples

### Real data example from test set
data("algdat.pfull")
res <- redist.rsg(algdat.pfull$adjlist, algdat.pfull$precinct.data$pop, 3, 0.05)

## Not run: 
##D ### Example that generates test data from a square map with equal population
##D districts
##D ### Number of precincts is Nrows*Ncols
##D ### getTest() outputs an adjacency list out of specified rows and columns
##D 
##D genTest <- function(Nrows,Ncols){
##D NN <- Nrows * Ncols
##D geog <- matrix(NA,nrow=Nrows+2, ncol=Ncols+2)
##D geog[2:(Nrows+1), 2:(Ncols+1)] <- 0:(NN-1)
##D 
##D adj.list <- vector("list", NN)
##D 
##D for(i in 2:(Nrows+1)){
##D     for(j in 2:(Ncols+1)){
##D         adj.list[[ geog[i,j] + 1 ]] <- c(geog[i-1,j],geog[i+1,j],geog[i,j-1],geog[i,j+1])
##D     }
##D }
##D adj.list <- lapply(adj.list, na.omit)
##D adj.list <- lapply(adj.list, as.numeric)
##D return(adj.list)
##D }
##D 
##D ### Generate a 100x100 precinct map and redistrict it into 10 districts
##D adj.list <- genTest(100,100)
##D population <- rep(300,length(adj.list))
##D tmp <- redist.rsg(adj.list, population, 10, 0.05)
## End(Not run)



