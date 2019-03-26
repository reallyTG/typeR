library(parallelDist)


### Name: parDist
### Title: Parallel Distance Matrix Computation using multiple Threads
### Aliases: parDist parallelDist

### ** Examples

## Not run: 
##D ## predefined distance functions
##D # defining a matrix, where each row corresponds to one series
##D sample.matrix <- matrix(c(1:100), ncol = 10)
##D 
##D # euclidean distance
##D parDist(x = sample.matrix, method = "euclidean")
##D # minkowski distance with parameter p=2
##D parDist(x = sample.matrix, method = "minkowski", p=2)
##D # dynamic time warping distance
##D parDist(x = sample.matrix, method = "dtw")
##D # dynamic time warping distance normalized with warping path length
##D parDist(x = sample.matrix, method = "dtw", norm.method="path.length")
##D # dynamic time warping with different step pattern
##D parDist(x = sample.matrix, method = "dtw", step.pattern="symmetric2")
##D # dynamic time warping with window size constraint
##D parDist(x = sample.matrix, method = "dtw", step.pattern="symmetric2", window.size=1)
##D 
##D ## multi-dimensional distance functions using list of matrices
##D # defining a list of matrices, where each list entry row corresponds to a two dimensional series
##D tmp.mat <- matrix(c(1:40), ncol = 10)
##D sample.matrix.list <- list(tmp.mat[1:2,], tmp.mat[3:4,])
##D 
##D # multi-dimensional euclidean distance
##D parDist(x = sample.matrix.list, method = "euclidean")
##D # multi-dimensional dynamic time warping
##D parDist(x = sample.matrix.list, method = "dtw")
##D 
##D ## user-defined distance function
##D library(RcppArmadillo)
##D # Use RcppXPtrUtils for simple usage of C++ external pointers
##D library(RcppXPtrUtils)
##D 
##D # compile user-defined function and return pointer (RcppArmadillo is used as dependency)
##D euclideanFuncPtr <- cppXPtr(
##D "double customDist(const arma::mat &A, const arma::mat &B) {
##D   return sqrt(arma::accu(arma::square(A - B)));
##D }", depends = c("RcppArmadillo"))
##D 
##D # distance matrix for user-defined euclidean distance function (note that method is set to "custom")
##D parDist(matrix(1:16, ncol=2), method="custom", func = euclideanFuncPtr)
## End(Not run)



