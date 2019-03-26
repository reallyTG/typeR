library(BayesH)


### Name: bayesModel.fit
### Title: Bayesian regression model with mixture of two scaled inverse chi
###   square as hyperprior distribution.
### Aliases: bayesModel.fit

### ** Examples


data(example)

mod = bayesModel.fit(X = X, y = y, nu0 = c(3,30,20), 
                     s0 =  c(1e-10,0.1, 0.5), niter = 2000, 
                     burnin = 300, type = "bayesH" )
summary(mod)





