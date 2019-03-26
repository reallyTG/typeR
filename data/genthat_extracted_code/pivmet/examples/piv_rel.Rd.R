library(pivmet)


### Name: piv_rel
### Title: Performing the pivotal relabelling step and computing the
###   relabelled posterior estimates
### Aliases: piv_rel

### ** Examples


#Univariate simulation
## Not run: 
##D N   <- 250
##D nMC <- 2500
##D k   <- 3
##D p   <- rep(1/k,k)
##D x   <- 3
##D stdev <- cbind(rep(1,k), rep(200,k))
##D Mu    <- seq(-trunc(k/2)*x,trunc(k/2)*x,length=k)
##D W     <- c(0.2,0.8)
##D sim   <- piv_sim(N,k,Mu,stdev,W=W)
##D res   <- piv_MCMC(y = sim$y, k =k, nMC = nMC)
##D rel   <- piv_rel(mcmc=res, nMC = nMC)
## End(Not run)

#Bivariate simulation
## Not run: 
##D N <- 200
##D k <- 3
##D nMC <- 5000
##D M1  <- c(-.5,8)
##D M2  <- c(25.5,.1)
##D M3  <- c(49.5,8)
##D Mu  <- matrix(rbind(M1,M2,M3),c(k,2))
##D stdev <- cbind(rep(1,k), rep(200,k))
##D Sigma.p1 <- matrix(c(stdev[1,1],0,0,stdev[1,1]),
##D                    nrow=2, ncol=2)
##D Sigma.p2 <- matrix(c(stdev[1,2],0,0,stdev[1,2]),
##D                    nrow=2, ncol=2)
##D W <- c(0.2,0.8)
##D sim <- piv_sim(N,k,Mu,stdev,Sigma.p1,Sigma.p2,W)
##D res <- piv_MCMC(y = sim$y, k = k, nMC = nMC)
##D rel <- piv_rel(mcmc = res, nMC = nMC)
##D piv_plot(y=sim$y, mcmc=res, rel_est = rel, type="chains")
##D piv_plot(y=sim$y, mcmc=res, rel_est = rel,
##D          type="hist")
## End(Not run)




