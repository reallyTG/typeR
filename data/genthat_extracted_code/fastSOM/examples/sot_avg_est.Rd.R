library(fastSOM)


### Name: sot_avg_est
### Title: Estimation of the Average, Minimal, and Maximal Entries of a
###   Spillover Table
### Aliases: sot_avg_est
### Keywords: estimated average of spillover table

### ** Examples

# generate randomly positive definite matrix Sigma of dimension N 
N <- 10
Sigma <- crossprod(matrix(rnorm(N*N),nrow=N)) 
# generate randomly coefficient matrices
H <- 10 
A <- array(rnorm(N*N*H),dim=c(N,N,H)) 
# calculate estimates of the average, minimal, 
# and maximal entries within a spillover table
sot_avg_est(Sigma, A) 



