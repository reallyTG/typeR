library(cvxclustr)


### Name: find_clusters
### Title: Find clusters
### Aliases: find_clusters

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
gamma <- seq(0.0,43, length.out=100)

## Perform clustering
nu <- AMA_step_size(w,n)
sol <- cvxclust_path_ama(X,w,gamma,nu=nu)

## Construct adjacency matrix
A <- create_adjacency(sol$V[[10]],w,n)
find_clusters(A)



