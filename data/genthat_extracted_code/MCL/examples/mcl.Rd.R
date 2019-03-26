library(MCL)


### Name: mcl
### Title: Markov Cluster Algorithm
### Aliases: mcl
### Keywords: graphs cluster

### ** Examples

### Generate adjacency matrix of undirected graph
adjacency <- matrix(c(0,1,1,1,0,0,0,0,0,1,0,1,1,1,0,0,0,0,1,1,
                      0,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,0,0,
                      0,1,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,1,1,
                      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), 
                      byrow=TRUE, nrow=9)

### Plot graph (requires package igraph) 
# library(igraph)
# gu <- graph.adjacency( adjacency, mode="undirected" )
# plot( gu )

### Run MCL
mcl(x = adjacency, addLoops=TRUE, ESM = TRUE)

### Allow clusters of size 1
mcl(x = adjacency, addLoops = TRUE, allow1 = TRUE)

### Error: Small inflation coefficient prevents that an 
###        equilibrium state matrix is reached within 100 iterations
mcl(x = adjacency, addLoops=TRUE, inflation = 1.01, max.iter = 100)


### Generate adjacency matrix of directed graph
dgr <- matrix(0,nrow = 10,ncol = 10)
dgr[2:3,1] <- 1; dgr[3:4,2] <- 1; dgr[5:6,4] <- 1
dgr[6:7,5] <- 1; dgr[8:9,7] <- 1; dgr[10,8:9] <- 1

### Plot graph (requires package igraph) 
# library( igraph )
# gd <- graph.adjacency( dgr )
# plot( gd )

### Directed graphs require self-loops!
mcl(x = dgr, addLoops = TRUE)




