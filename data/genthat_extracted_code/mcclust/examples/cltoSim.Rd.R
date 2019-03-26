library(mcclust)


### Name: cltoSim
### Title: Compute Similarity Matrix for a Clustering and vice versa
### Aliases: cltoSim Simtocl
### Keywords: cluster

### ** Examples

cl <- c(3,3,1,2,2)
(Sim <- cltoSim(cl))
Simtocl(Sim) 

# not a valid similarity matrix
(Sim2 <- matrix(c(1,0,1,0,1,1,1,1,1), ncol=3))
Simtocl(Sim2) # no warning



