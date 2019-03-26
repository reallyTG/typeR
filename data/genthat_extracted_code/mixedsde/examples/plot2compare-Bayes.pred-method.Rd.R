library(mixedsde)


### Name: plot2compare,Bayes.pred-method
### Title: Comparing plot method plot2compare for three Bayesian prediction
###   class objects
### Aliases: plot2compare,Bayes.pred-method

### ** Examples

random <- 1; sigma <- 0.1; fixed <- 5; param <- c(3, 0.5)
sim <- mixedsde.sim(M = 20, T = 1, N = 50, model = 'OU', random = random, fixed = fixed,
       density.phi = 'normal',param= param, sigma= sigma, X0 = 0, op.plot = 1)

# here: only 100 iterations for example - should be much more!
estim_Bayes_withoutprior <- mixedsde.fit(times = sim$times, X = sim$X, model = 'OU',
             random, estim.method = 'paramBayes',  nMCMC = 100)
prior <- list( m = c(param[1], fixed), v = c(param[1], fixed), alpha.omega = 11,
            beta.omega = param[2]^2*10, alpha.sigma = 10, beta.sigma = sigma^2*9)
estim_Bayes <- mixedsde.fit(times = sim$times, X = sim$X, model = 'OU', random, 
           estim.method = 'paramBayes', prior = prior, nMCMC = 100) 
plot2compare(estim_Bayes, estim_Bayes_withoutprior, names = c('with prior', 'without prior'))



