library(lvmcomp)


### Name: StEM_pcirt
### Title: Stochastic EM algorithm for solving generalized partial credit
###   model
### Aliases: StEM_pcirt

### ** Examples

# run a toy example based on the partial credit model

# load a simulated dataset
attach(data_sim_pcirt)

# generate starting values for the algorithm
A0 <- Q
D0 <- matrix(1, J, M)
D0[,1] <- 0
theta0 <- matrix(rnorm(N*K), N, K)
sigma0 <- diag(1, K)

# do the confirmatory partial credit model analysis 
# to enable multicore processing, set parallel = T
pcirt_res <- StEM_pcirt(response, Q, A0, D0, theta0, sigma0)




