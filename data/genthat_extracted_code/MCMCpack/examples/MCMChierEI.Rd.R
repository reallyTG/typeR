library(MCMCpack)


### Name: MCMChierEI
### Title: Markov Chain Monte Carlo for Wakefield's Hierarchial Ecological
###   Inference Model
### Aliases: MCMChierEI
### Keywords: models

### ** Examples


   ## Not run: 
##D ## simulated data example
##D set.seed(3920)
##D n <- 100
##D r0 <- round(runif(n, 400, 1500))
##D r1 <- round(runif(n, 100, 4000))
##D p0.true <- pnorm(rnorm(n, m=0.5, s=0.25))
##D p1.true <- pnorm(rnorm(n, m=0.0, s=0.10))
##D y0 <- rbinom(n, r0, p0.true)
##D y1 <- rbinom(n, r1, p1.true)
##D c0 <- y0 + y1
##D c1 <- (r0+r1) - c0
##D 
##D ## plot data
##D tomogplot(r0, r1, c0, c1)
##D 
##D ## fit exchangeable hierarchical model
##D post <- MCMChierEI(r0,r1,c0,c1, mcmc=40000, thin=5, verbose=100,
##D                     seed=list(NA, 1))
##D 
##D p0meanHier <- colMeans(post)[1:n]
##D p1meanHier <- colMeans(post)[(n+1):(2*n)]
##D 
##D ## plot truth and posterior means
##D pairs(cbind(p0.true, p0meanHier, p1.true, p1meanHier))
##D    
## End(Not run)




