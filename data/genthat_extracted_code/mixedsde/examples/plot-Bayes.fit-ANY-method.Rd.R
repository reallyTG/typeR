library(mixedsde)


### Name: plot,Bayes.fit,ANY-method
### Title: Plot method for the Bayesian estimation class object
### Aliases: plot,Bayes.fit,ANY-method

### ** Examples

random <- c(1,2); sigma <- 0.1; param <- c(3, 0.5, 5, 0.2)

sim <- mixedsde.sim(M = 20, T = 1, N = 50, model = 'OU', random = random, 
       density.phi = 'normalnormal', param = param, sigma = sigma, X0 = 0, op.plot = 1)

# here: only 100 iterations for example - should be much more!
prior <- list(m = param[c(1,3)], v = param[c(1,3)], alpha.omega = c(11,11), 
           beta.omega = param[c(2,4)]^2*10, alpha.sigma = 10, beta.sigma = sigma^2*9)
estim_Bayes <- mixedsde.fit(times = sim$times, X = sim$X, model = 'OU', random = random,
                estim.method = 'paramBayes', prior = prior, nMCMC = 100) 
plot(estim_Bayes)
plot(estim_Bayes, style = 'cred.int', true.phi = sim$phi)
plot(estim_Bayes, style = 'acf')
plot(estim_Bayes, style = 'density')




