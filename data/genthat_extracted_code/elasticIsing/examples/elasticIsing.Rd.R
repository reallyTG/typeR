library(elasticIsing)


### Name: elasticIsing
### Title: Estimate Ising model using elastic-net and cross-validation.
### Aliases: elasticIsing

### ** Examples

library("IsingSampler")

# Input:
P <- 5 # Number of nodes
nSample <- 250 # Number of samples

# Chain graph:
Graph <- matrix(0, P, P)
for (i in 1:P){
  Graph[i,i%%P+1] <- Graph[i%%P+1,i] <- 0.5
}

# Thresholds:
Thresh <- rep(0, P)

# Response options (0,1 or -1,1):
Resp <- c(0L,1L)

# Simulate with metropolis:
Data <- IsingSampler(nSample, Graph, Thresh)

## Not run: 
##D # Estimate:
##D Res <- elasticIsing(Data)
##D 
##D # Optimal graph:
##D optimalGraph(Res)
##D 
##D # Plot result:
##D plot(Res)
##D 
##D # Cost plots:
##D costPlots(Res)
## End(Not run)



