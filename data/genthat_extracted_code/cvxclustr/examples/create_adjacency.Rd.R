library(cvxclustr)


### Name: create_adjacency
### Title: Create adjacency matrix from V
### Aliases: create_adjacency

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
G <- graph.adjacency(A, mode = 'upper')
plot(G,vertex.label=as.character(mammals[,1]),vertex.label.cex=0.65,vertex.label.font=2)



