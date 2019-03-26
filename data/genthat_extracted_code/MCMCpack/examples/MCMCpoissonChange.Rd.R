library(MCMCpack)


### Name: MCMCpoissonChange
### Title: Markov Chain Monte Carlo for a Poisson Regression Changepoint
###   Model
### Aliases: MCMCpoissonChange
### Keywords: models

### ** Examples


    ## Not run: 
##D     set.seed(11119)
##D     n <- 150
##D     x1 <- runif(n, 0, 0.5)
##D     true.beta1 <- c(1,  1)
##D     true.beta2 <- c(1,  -2)
##D     true.beta3 <- c(1,  2)
##D 
##D     ## set true two breaks at (50, 100)
##D     true.s <- rep(1:3, each=n/3)
##D     mu1 <- exp(1 + x1[true.s==1]*1)
##D     mu2 <- exp(1 + x1[true.s==2]*-2)
##D     mu3 <- exp(1 + x1[true.s==3]*2)
##D 
##D     y <- as.ts(c(rpois(n/3, mu1), rpois(n/3, mu2), rpois(n/3, mu3)))
##D     formula = y ~ x1
##D 
##D     ## fit multiple models with a varying number of breaks
##D     model0 <-  MCMCpoissonChange(formula, m=0,
##D             mcmc = 1000, burnin = 1000, verbose = 500,
##D             b0 = rep(0, 2), B0 = 5*diag(2), marginal.likelihood = "Chib95")
##D     model1 <-  MCMCpoissonChange(formula, m=1,
##D             mcmc = 1000, burnin = 1000, verbose = 500,
##D             b0 = rep(0, 2), B0 = 5*diag(2), marginal.likelihood = "Chib95")
##D     model2 <-  MCMCpoissonChange(formula, m=2,
##D             mcmc = 1000, burnin = 1000, verbose = 500,
##D             b0 = rep(0, 2), B0 = 5*diag(2), marginal.likelihood = "Chib95")
##D     model3 <-  MCMCpoissonChange(formula, m=3,
##D             mcmc = 1000, burnin = 1000, verbose = 500,
##D             b0 = rep(0, 2), B0 = 5*diag(2), marginal.likelihood = "Chib95")
##D     model4 <-  MCMCpoissonChange(formula, m=4,
##D             mcmc = 1000, burnin = 1000, verbose = 500,
##D             b0 = rep(0, 2), B0 = 5*diag(2), marginal.likelihood = "Chib95")
##D     model5 <-  MCMCpoissonChange(formula, m=5,
##D             mcmc = 1000, burnin = 1000, verbose = 500,
##D             b0 = rep(0, 2), B0 = 5*diag(2), marginal.likelihood = "Chib95")
##D 
##D     ## find the most reasonable one
##D     print(BayesFactor(model0, model1, model2, model3, model4, model5))
##D 
##D     ## draw plots using the "right" model
##D     par(mfrow=c(attr(model2, "m") + 1, 1), mai=c(0.4, 0.6, 0.3, 0.05))
##D     plotState(model2, legend.control = c(1, 0.6))
##D     plotChangepoint(model2, verbose = TRUE, ylab="Density", start=1, overlay=TRUE)
##D 
##D     ## No covariate case
##D     model2.1 <- MCMCpoissonChange(y ~ 1, m = 2, c0 = 2, d0 = 1,
##D              mcmc = 1000, burnin = 1000, verbose = 500,
##D              marginal.likelihood = "Chib95")
##D     print(BayesFactor(model2, model2.1))
##D     
## End(Not run)




