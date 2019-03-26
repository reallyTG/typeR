library(cvxclustr)


### Name: weights_graph
### Title: Weights Graph Adjacency Matrix
### Aliases: weights_graph

### ** Examples

## Clusterpaths for Mammal Dentition
data(mammals)
X <- as.matrix(mammals[,-1])
X <- t(scale(X,center=TRUE,scale=FALSE))
n <- ncol(X)

## Pick some weights and a sequence of regularization parameters.
k <- 5
phi <- 0.5
w <- kernel_weights(X,phi)
w <- knn_weights(w,k,n)

A <- weights_graph(w,n)
find_clusters(A)

## Visualize Cluster Assignment
G <- graph.adjacency(A, mode = 'upper')
plot(G,vertex.label=as.character(mammals[,1]),vertex.label.cex=0.65,vertex.label.font=2)



