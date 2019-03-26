library(fastSOM)


### Name: soi_from_sot
### Title: Calculation of the Spillover Index for a given Spillover Table
### Aliases: soi_from_sot
### Keywords: spillover index from spillover table

### ** Examples

# generate randomly positive definite matrix Sigma of dimension N 
N <- 10
Sigma <- crossprod(matrix(rnorm(N*N),nrow=N)) 
# generate randomly coefficient matrices
H <- 10 
A <- array(rnorm(N*N*H),dim=c(N,N,H)) 
# calculate spillover table
SOT <- sot(Sigma,A) 
# calculate spillover index from spillover table
soi_from_sot(SOT) 



