library(ordinalLBM)


### Name: simu.olbm
### Title: Simulate OLBM data
### Aliases: simu.olbm

### ** Examples


M <- 150                                    
P <- 100 
Q <- 3
L <- 2

## connectivity matrix
Pi <- matrix(.7, nrow = Q, ncol = L)
Pi[1,1] <- Pi[2,2] <- Pi[3,2] <- .5

## cluster memberships proportions
rho <- c(1/3, 1/3 ,1/3)
delta <- c(1/2, 1/2)

# Thresholds
thresh <- c(-Inf, 2.37, 2.67, 3.18, 4.33, Inf)     # K = 5

## Gaussian parameters
mu <- matrix(c(0, 3.4, 2.6, 0, 2.6, 3.4), nrow = Q, ncol = L)   
sd <- matrix(c(1.2,1.4,1.0,1.2,1.4,1.0), nrow = Q, ncol = L)

## Data simulation
dat <- simu.olbm(M, P, Pi, rho, delta, mu, sd, thresh)




