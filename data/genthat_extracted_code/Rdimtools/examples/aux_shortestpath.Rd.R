library(Rdimtools)


### Name: aux.shortestpath
### Title: Find shortest path using Floyd-Warshall algorithm
### Aliases: aux.shortestpath

### ** Examples

## Not run: 
##D ## Generate 10-sample data
##D X = aux.gensamples(n=10)
##D 
##D ## Find knn graph with k=3
##D Xgraph = aux.graphnbd(X,type=c("knn",3))
##D 
##D ## Separately use binarized and real distance matrices
##D W1 = aux.shortestpath(Xgraph$mask)
##D W2 = aux.shortestpath(Xgraph$dist)
##D 
##D par(mfrow=c(1,2))
##D image(W1); title("from binarized")
##D image(W2); title("from Euclidean distance")
## End(Not run)




