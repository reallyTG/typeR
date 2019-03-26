library(pivmet)


### Name: piv_MCMC
### Title: JAGS Sampling for Gaussian Mixture Models and Clustering via
###   Co-Association Matrix.
### Aliases: piv_MCMC

### ** Examples


# Bivariate simulation
## Not run: 
##D N   <- 200
##D k   <- 4
##D nMC <- 1000
##D M1  <-c(-.5,8)
##D M2  <- c(25.5,.1)
##D M3  <- c(49.5,8)
##D M4  <- c(63.0,.1)
##D Mu  <- matrix(rbind(M1,M2,M3,M4),c(4,2))
##D stdev    <- cbind(rep(1,k), rep(200,k))
##D Sigma.p1 <- matrix(c(stdev[1,1],0,0,stdev[1,1]), nrow=2, ncol=2)
##D Sigma.p2 <- matrix(c(stdev[1,2],0,0,stdev[1,2]), nrow=2, ncol=2)
##D W <- c(0.2,0.8)
##D sim <- piv_sim(N,k,Mu, stdev, Sigma.p1,Sigma.p2,W)
##D res <- piv_MCMC(y = sim$y, k =k, nMC = nMC)
##D #changing priors
##D res2 <- piv_MCMC(y = sim$y,
##D                  priors = list (
##D                  mu0=c(1,1),
##D                  S2 = matrix(c(0.002,0,0, 0.1),2,2, byrow=TRUE),
##D                  S3 = matrix(c(0.1,0,0,0.1), 2,2, byrow =TRUE)),
##D                  k = k, nMC = nMC)
## End(Not run)


# Fishery data (bayesmix package)
## Not run: 
##D data(fish)
##D y <- fish[,1]
##D k <- 5
##D nMC <- 5000
##D res <- piv_MCMC(y = y, k = k, nMC = nMC)
##D # changing priors
##D res2   <- piv_MCMC(y = y,
##D                    priors = list(kind = "condconjugate",
##D                    parameter = "priorsRaftery",
##D                    hierarchical = "tau"),  k =k, nMC = nMC)
## End(Not run)



