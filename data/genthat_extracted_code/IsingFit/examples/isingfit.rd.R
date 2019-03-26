library(IsingFit)


### Name: IsingFit
### Title: Network estimation using the eLasso method
### Aliases: IsingFit

### ** Examples

library("IsingSampler")

### Simulate dataset ###
# Input:
N <- 6 # Number of nodes
nSample <- 1000 # Number of samples

# Ising parameters:
Graph <- matrix(sample(0:1,N^2,TRUE,prob = c(0.8, 0.2)),N,N) * runif(N^2,0.5,2)
Graph <- pmax(Graph,t(Graph))
diag(Graph) <- 0
Thresh <- -rowSums(Graph) / 2

# Simulate:
Data <- IsingSampler(nSample, Graph, Thresh)

### Fit using IsingFit ###
Res <- IsingFit(Data, family='binomial', plot=FALSE)

# Plot results:
library("qgraph")
layout(t(1:2))
qgraph(Res$weiadj,fade = FALSE)
title("Estimated network")
qgraph(Graph,fade = FALSE)
title("Original network")



