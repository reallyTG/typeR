library(MCMCpack)


### Name: MCMCregressChange
### Title: Markov Chain Monte Carlo for a linear Gaussian Multiple
###   Changepoint Model
### Aliases: MCMCregressChange
### Keywords: models

### ** Examples


## Not run: 
##D set.seed(1119)
##D n <- 100
##D x1 <- runif(n)
##D true.beta1 <- c(2, -2)
##D true.beta2 <- c(0,  2)
##D true.Sigma <- c(1, 2)
##D true.s <- rep(1:2, each=n/2)
##D 
##D mu1 <- cbind(1, x1[true.s==1])%*%true.beta1
##D mu2 <- cbind(1, x1[true.s==2])%*%true.beta2
##D 
##D y <- as.ts(c(rnorm(n/2, mu1, sd=sqrt(true.Sigma[1])), rnorm(n/2, mu2, sd=sqrt(true.Sigma[2]))))
##D formula=y ~ x1
##D 
##D ols1 <- lm(y[true.s==1] ~x1[true.s==1])
##D ols2 <- lm(y[true.s==2] ~x1[true.s==2])
##D 
##D ## prior
##D b0 <- 0
##D B0 <- 1
##D sigma.mu=sd(y)
##D sigma.var=var(y)
##D 
##D ## models
##D model0 <-  MCMCregressChange(formula, m=0, b0=b0, B0=B0, mcmc=100, burnin=100,
##D            sigma.mu=sigma.mu, sigma.var=sigma.var, marginal.likelihood="Chib95")
##D model1 <-  MCMCregressChange(formula, m=1, b0=b0, B0=B0, mcmc=100, burnin=100,
##D            sigma.mu=sigma.mu, sigma.var=sigma.var, marginal.likelihood="Chib95")
##D model2 <-  MCMCregressChange(formula, m=2, b0=b0, B0=B0, mcmc=100, burnin=100,
##D            sigma.mu=sigma.mu, sigma.var=sigma.var, marginal.likelihood="Chib95")
##D model3 <-  MCMCregressChange(formula, m=3, b0=b0, B0=B0, mcmc=100, burnin=100,
##D            sigma.mu=sigma.mu, sigma.var=sigma.var, marginal.likelihood="Chib95")
##D model4 <-  MCMCregressChange(formula, m=4, b0=b0, B0=B0, mcmc=100, burnin=100,
##D            sigma.mu=sigma.mu, sigma.var=sigma.var, marginal.likelihood="Chib95")
##D model5 <-  MCMCregressChange(formula, m=5, b0=b0, B0=B0, mcmc=100, burnin=100,
##D            sigma.mu=sigma.mu, sigma.var=sigma.var, marginal.likelihood="Chib95")
##D 
##D print(BayesFactor(model0, model1, model2, model3, model4, model5))
##D plotState(model1)
##D plotChangepoint(model1)
##D 
## End(Not run)




