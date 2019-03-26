library(fastSOM)


### Name: sot
### Title: Calculation of Spillover Tables
### Aliases: sot
### Keywords: spillover table

### ** Examples

# generate randomly positive definite matrix Sigma of dimension N 
N <- 10
Sigma <- crossprod(matrix(rnorm(N*N),nrow=N)) 
# generate randomly coefficient matrices
H <- 10 
A <- array(rnorm(N*N*H),dim=c(N,N,H)) 
# calculate spillover table
sot(Sigma,A) 



