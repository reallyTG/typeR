library(MCMCpack)


### Name: MCMCbinaryChange
### Title: Markov Chain Monte Carlo for a Binary Multiple Changepoint Model
### Aliases: MCMCbinaryChange
### Keywords: models

### ** Examples


    ## Not run: 
##D     set.seed(19173)
##D     true.phi<- c(0.5, 0.8, 0.4)
##D 
##D     ## two breaks at c(80, 180)
##D     y1 <- rbinom(80, 1,  true.phi[1])
##D     y2 <- rbinom(100, 1, true.phi[2])
##D     y3 <- rbinom(120, 1, true.phi[3])
##D     y  <- as.ts(c(y1, y2, y3))
##D 
##D     model0 <- MCMCbinaryChange(y, m=0, c0=2, d0=2, mcmc=100, burnin=100, verbose=50,
##D     	      marginal.likelihood = "Chib95")
##D     model1 <- MCMCbinaryChange(y, m=1, c0=2, d0=2, mcmc=100, burnin=100, verbose=50,
##D     	      marginal.likelihood = "Chib95")
##D     model2 <- MCMCbinaryChange(y, m=2, c0=2, d0=2, mcmc=100, burnin=100, verbose=50,
##D     	      marginal.likelihood = "Chib95")
##D     model3 <- MCMCbinaryChange(y, m=3, c0=2, d0=2, mcmc=100, burnin=100, verbose=50,
##D     	      marginal.likelihood = "Chib95")
##D     model4 <- MCMCbinaryChange(y, m=4, c0=2, d0=2, mcmc=100, burnin=100, verbose=50,
##D     	      marginal.likelihood = "Chib95")
##D     model5 <- MCMCbinaryChange(y, m=5, c0=2, d0=2, mcmc=100, burnin=100, verbose=50,
##D     	      marginal.likelihood = "Chib95")
##D 
##D     print(BayesFactor(model0, model1, model2, model3, model4, model5))
##D 
##D     ## plot two plots in one screen
##D     par(mfrow=c(attr(model2, "m") + 1, 1), mai=c(0.4, 0.6, 0.3, 0.05))
##D     plotState(model2, legend.control = c(1, 0.6))
##D     plotChangepoint(model2, verbose = TRUE, ylab="Density", start=1, overlay=TRUE)
##D 
##D     
## End(Not run)




