library(fastSOM)


### Name: soi_avg_exact
### Title: Exact Calculation of Average, Minimal, and Maximal Spillover
###   Index
### Aliases: soi_avg_exact
### Keywords: exact average of spillover index

### ** Examples

# generate randomly positive definite matrix Sigma of dimension N 
N <- 10
Sigma <- crossprod(matrix(rnorm(N*N),nrow=N)) 
# generate randomly coefficient matrices
H <- 10 
A <- array(rnorm(N*N*H),dim=c(N,N,H)) 
# calculate the exact average, minimal, 
# and maximal spillover index and determine the corresponding ordering 
# of the model variables
soi_avg_exact(Sigma, A) 



