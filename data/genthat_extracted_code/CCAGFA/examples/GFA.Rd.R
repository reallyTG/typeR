library(CCAGFA)


### Name: GFA
### Title: Estimate a Bayesian IBFA/CCA/GFA model
### Aliases: GFA CCA GFAexperiment CCAexperiment

### ** Examples

#
# Create simple random data
#

N <- 50; D <- c(4,6)       # 50 samples with 4 and 6 dimensions
tau <- c(3,3)              # residual noise precision

K <- 3                          # K real components (1 shared, 1+1 private)
Z <- matrix(rnorm(N*K,0,1),N,K) # drawn from the prior
alpha <- matrix(c(1,1,1e6,1,1e6,1),2,3) 

Y <- vector("list",length=2)
W <- vector("list",length=2)

for(view in 1:2) {
  W[[view]] <- matrix(0,D[view],K)
  for(k in 1:K) {
    W[[view]][,k] <- rnorm(D[view],0,1/sqrt(alpha[view,k]))
  }
  Y[[view]] <- Z %*% t(W[[view]]) +
    matrix(rnorm(N*D[view],0,1/sqrt(tau[view])),N,D[view])
}

#
# Run the model
#
opts <- getDefaultOpts()
opts$iter.max <- 10       # Terminate early for fast testing

# Only tries two random initializations for faster testing
model <- CCAexperiment(Y,K,opts,Nrep=2)




