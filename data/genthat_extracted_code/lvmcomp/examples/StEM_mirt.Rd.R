library(lvmcomp)


### Name: StEM_mirt
### Title: Stochastic EM algorithm for solving multivariate item response
###   theory model
### Aliases: StEM_mirt

### ** Examples

# run a toy example based on the M2PL model

# load a simulated dataset
attach(data_sim_mirt)

# generate starting values for the algorithm
A0 <- Q
d0 <- rep(0, J)
theta0 <- matrix(rnorm(N*K, 0, 1),N)
sigma0 <- diag(1, K) 

# do the confirmatory MIRT analysis
# to enable multicore processing, set parallel = T
mirt_res <- StEM_mirt(response, Q, A0, d0, theta0, sigma0)




