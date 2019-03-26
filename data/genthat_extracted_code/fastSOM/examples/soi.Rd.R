library(fastSOM)


### Name: soi
### Title: Calculation of the Spillover Index
### Aliases: soi
### Keywords: spillover index

### ** Examples

# generate randomly positive definite matrix Sigma of dimension N 
N <- 10
Sigma <- crossprod(matrix(rnorm(N*N),nrow=N)) 
# generate randomly coefficient matrices
H <- 10 
A <- array(rnorm(N*N*H),dim=c(N,N,H)) 
# calculate the spillover index
soi(Sigma, A)



