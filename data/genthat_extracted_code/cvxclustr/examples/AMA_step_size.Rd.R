library(cvxclustr)


### Name: AMA_step_size
### Title: Compute step size Anderson-Morely upper bound on the largest
###   eigenvalue of the Laplacian
### Aliases: AMA_step_size

### ** Examples

data(mammals)
X <- as.matrix(mammals[,-1])
X <- t(scale(X,center=TRUE,scale=FALSE))
n <- ncol(X)

## Pick some weights and a sequence of regularization parameters.
k <- 5
phi <- 0.5
w <- kernel_weights(X,phi)
w <- knn_weights(w,k,n)
AMA_step_size(w,n)



