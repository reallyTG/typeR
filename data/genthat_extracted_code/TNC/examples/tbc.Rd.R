library(TNC)


### Name: tbc
### Title: Temporal betweenness centrality
### Aliases: tbc

### ** Examples

# Create a list of adjacency matrices, plot the corresponding graphs
# (using the igraph package) and calculate tbc

A1 <- matrix(c(0,1,0,0,0,0,
               1,0,1,0,0,0,
               0,1,0,0,0,0,
               0,0,0,0,0,0,
               0,0,0,0,0,0,
               0,0,0,0,0,0), ncol=6)

A2 <- matrix(c(0,0,0,0,0,0,
               0,0,1,0,0,0,
               0,1,0,1,1,0,
               0,0,1,0,0,0,
               0,0,1,0,0,0,
               0,0,0,0,0,0), ncol=6)

A3 <- matrix(c(0,0,0,0,0,0,
               0,0,0,0,0,0,
               0,0,0,0,0,0,
               0,0,0,0,0,0,
               0,0,0,0,0,0,
               0,0,0,0,0,0), ncol=6)

A4 <- matrix(c(0,1,0,0,0,0,
               1,0,0,1,0,0,
               0,0,0,0,0,0,
               0,1,0,0,0,0,
               0,0,0,0,0,0,
               0,0,0,0,0,0), ncol=6)

library(igraph)
par(mfrow=c(2,2))

Layout <-
 layout_in_circle(graph_from_adjacency_matrix(A1, mode = "undirected"))

plot(graph_from_adjacency_matrix(A1, "undirected"), layout=Layout)
plot(graph_from_adjacency_matrix(A2, "undirected"), layout=Layout)
plot(graph_from_adjacency_matrix(A3, "undirected"), layout=Layout)
plot(graph_from_adjacency_matrix(A4, "undirected"), layout=Layout)

As <- list(A1,A2,A3,A4)

tbc(As, "M", centrality_evolution=TRUE)

### Create list of adjacency lists
Ls <- lapply(seq_along(As), function(i){
  sapply(1:6, function(j){which(As[[i]][j,]==1)})
})

tbc(Ls, "L", centrality_evolution=TRUE)

### Run tbc in parallel ###
library(parallel)
# Calculate the number of cores
cores_avail <- detectCores()-1
# Initiate cluster
cl <- makeCluster(2)
clusterExport(cl, c("As", "tbc"))

TBC <- parLapply(cl, 1:6, function(x){
  tbc(As, "M", vertexindices = x)
 }
)

stopCluster(cl)

Reduce("+", TBC)



