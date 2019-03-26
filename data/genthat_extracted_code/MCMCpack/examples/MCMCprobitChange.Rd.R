library(MCMCpack)


### Name: MCMCprobitChange
### Title: Markov Chain Monte Carlo for a linear Gaussian Multiple
###   Changepoint Model
### Aliases: MCMCprobitChange
### Keywords: models

### ** Examples


## Not run: 
##D set.seed(1973)
##D x1 <- rnorm(300, 0, 1)
##D true.beta <- c(-.5, .2, 1)
##D true.alpha <- c(.1, -1., .2)
##D X <- cbind(1, x1)
##D 
##D ## set two true breaks at 100 and 200
##D true.phi1 <- pnorm(true.alpha[1] + x1[1:100]*true.beta[1])
##D true.phi2 <- pnorm(true.alpha[2] + x1[101:200]*true.beta[2])
##D true.phi3 <-  pnorm(true.alpha[3] + x1[201:300]*true.beta[3])
##D 
##D ## generate y
##D y1 <- rbinom(100, 1, true.phi1)
##D y2 <- rbinom(100, 1, true.phi2)
##D y3 <- rbinom(100, 1, true.phi3)
##D Y <- as.ts(c(y1, y2, y3))
##D 
##D ## fit multiple models with a varying number of breaks
##D out0 <- MCMCprobitChange(formula=Y~X-1, data=parent.frame(), m=0,
##D                          mcmc=1000, burnin=1000, thin=1, verbose=1000,
##D                          b0 = 0, B0 = 10, a = 1, b = 1,  marginal.likelihood = c("Chib95"))
##D out1 <- MCMCprobitChange(formula=Y~X-1, data=parent.frame(), m=1,
##D                          mcmc=1000, burnin=1000, thin=1, verbose=1000,
##D                          b0 = 0, B0 = 10, a = 1, b = 1,  marginal.likelihood = c("Chib95"))
##D out2 <- MCMCprobitChange(formula=Y~X-1, data=parent.frame(), m=2,
##D                          mcmc=1000, burnin=1000, thin=1, verbose=1000,
##D                          b0 = 0, B0 = 10, a = 1, b = 1,  marginal.likelihood = c("Chib95"))
##D out3 <- MCMCprobitChange(formula=Y~X-1, data=parent.frame(), m=3,
##D                          mcmc=1000, burnin=1000, thin=1, verbose=1000,
##D                          b0 = 0, B0 = 10, a = 1, b = 1,  marginal.likelihood = c("Chib95"))
##D 
##D ## find the most reasonable one
##D BayesFactor(out0, out1, out2, out3)
##D 
##D ## draw plots using the "right" model
##D plotState(out2)
##D plotChangepoint(out2)
## End(Not run)




