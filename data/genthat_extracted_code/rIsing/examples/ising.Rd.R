library(rIsing)


### Name: ising
### Title: High-Dimensional Ising Model Selection
### Aliases: ising

### ** Examples


## Not run: 
##D # simulate a dataset using IsingSampler
##D library(IsingSampler)
##D n = 1e3
##D p = 10
##D Theta <- matrix(sample(c(-0.5,0,0.5), replace = TRUE, size = p*p), nrow = p, ncol = p)
##D Theta <- Theta + t(Theta) # adjacency matrix must be symmetric
##D diag(Theta) <- 0
##D X <- unname(as.matrix(IsingSampler(n, graph = Theta, thresholds = 0, method = "direct") ))
##D m1 <- ising(X, symmetrize = "mean", gamma = 0.5, nlambda = 50)
##D 
##D # Visualize output using igraph
##D library(igraph)
##D ig <- graph_from_adjacency_matrix(m1$Theta, "undirected", weighted = TRUE, diag = FALSE)
##D plot.igraph(ig, vertex.color = "skyblue")
## End(Not run)



