library(MCMCpack)


### Name: MCMCdynamicEI
### Title: Markov Chain Monte Carlo for Quinn's Dynamic Ecological
###   Inference Model
### Aliases: MCMCdynamicEI
### Keywords: models

### ** Examples


   ## Not run: 
##D ## simulated data example 1
##D set.seed(3920)
##D n <- 100
##D r0 <- rpois(n, 2000)
##D r1 <- round(runif(n, 100, 4000))
##D p0.true <- pnorm(-1.5 + 1:n/(n/2))
##D p1.true <- pnorm(1.0 - 1:n/(n/4))
##D y0 <- rbinom(n, r0, p0.true)
##D y1 <- rbinom(n, r1, p1.true)
##D c0 <- y0 + y1
##D c1 <- (r0+r1) - c0
##D 
##D ## plot data
##D dtomogplot(r0, r1, c0, c1, delay=0.1)
##D 
##D ## fit dynamic model
##D post1 <- MCMCdynamicEI(r0,r1,c0,c1, mcmc=40000, thin=5, verbose=100,
##D                     seed=list(NA, 1))
##D 
##D ## fit exchangeable hierarchical model
##D post2 <- MCMChierEI(r0,r1,c0,c1, mcmc=40000, thin=5, verbose=100,
##D                     seed=list(NA, 2))
##D 
##D p0meanDyn <- colMeans(post1)[1:n]
##D p1meanDyn <- colMeans(post1)[(n+1):(2*n)]
##D p0meanHier <- colMeans(post2)[1:n]
##D p1meanHier <- colMeans(post2)[(n+1):(2*n)]
##D 
##D ## plot truth and posterior means
##D pairs(cbind(p0.true, p0meanDyn, p0meanHier, p1.true, p1meanDyn, p1meanHier))
##D 
##D 
##D ## simulated data example 2
##D set.seed(8722)
##D n <- 100
##D r0 <- rpois(n, 2000)
##D r1 <- round(runif(n, 100, 4000))
##D p0.true <- pnorm(-1.0 + sin(1:n/(n/4)))
##D p1.true <- pnorm(0.0 - 2*cos(1:n/(n/9)))
##D y0 <- rbinom(n, r0, p0.true)
##D y1 <- rbinom(n, r1, p1.true)
##D c0 <- y0 + y1
##D c1 <- (r0+r1) - c0
##D 
##D ## plot data
##D dtomogplot(r0, r1, c0, c1, delay=0.1)
##D 
##D ## fit dynamic model
##D post1 <- MCMCdynamicEI(r0,r1,c0,c1, mcmc=40000, thin=5, verbose=100,
##D                     seed=list(NA, 1))
##D 
##D ## fit exchangeable hierarchical model
##D post2 <- MCMChierEI(r0,r1,c0,c1, mcmc=40000, thin=5, verbose=100,
##D                     seed=list(NA, 2))
##D 
##D p0meanDyn <- colMeans(post1)[1:n]
##D p1meanDyn <- colMeans(post1)[(n+1):(2*n)]
##D p0meanHier <- colMeans(post2)[1:n]
##D p1meanHier <- colMeans(post2)[(n+1):(2*n)]
##D 
##D ## plot truth and posterior means
##D pairs(cbind(p0.true, p0meanDyn, p0meanHier, p1.true, p1meanDyn, p1meanHier))
##D    
## End(Not run)




