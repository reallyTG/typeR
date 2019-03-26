library(pivmet)


### Name: piv_sim
### Title: Generate Data from a Gaussian Nested Mixture
### Aliases: piv_sim

### ** Examples


# Bivariate mixture simulation with three components

N  <- 2000
k  <- 3
M1 <- c(-45,8)
M2 <- c(45,.1)
M3 <- c(100,8)
Mu <- matrix(rbind(M1,M2,M3),c(k,2))
stdev    <- cbind(rep(1,k), rep(200,k))
Sigma.p1 <- matrix(c(stdev[1,1],0,0,stdev[1,1]),
nrow=2, ncol=2)
Sigma.p2 <- matrix(c(stdev[1,2],0,0,stdev[1,2]),
 nrow=2, ncol=2)
W   <- c(0.2,0.8)
sim <- piv_sim(N, k, Mu, Sigma.p1 = Sigma.p1,
Sigma.p2 = Sigma.p2, W)
plot(sim$y, xlab="y[,1]", ylab="y[,2]")




