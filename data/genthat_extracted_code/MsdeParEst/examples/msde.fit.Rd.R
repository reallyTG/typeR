library(MsdeParEst)


### Name: msde.fit
### Title: Estimation Of The Random Effects In Mixed Stochastic
###   Differential Equations
### Aliases: msde.fit

### ** Examples



# Example 1 : One random effect in the drift and one random effect in the diffusion

sim <- msde.sim(M = 25, T = 1, N = 1000, model = 'OU', 
                drift.random = 2, drift.param = c(0,0.5,0.5), 
                diffusion.random = 1, diffusion.param = c(8,1/2))

res <- msde.fit(times = sim$times, X = sim$X, model = 'OU', drift.random = 2, 
diffusion.random = 1)

summary(res)
plot(res)

## Not run: 
##D 
##D # Example 2 : one mixture of two random effects in the drift, and one fixed effect in
##D # the diffusion coefficient
##D 
##D sim <- msde.sim(M = 100, T = 5, N = 5000, model = 'OU', drift.random = c(1,2),
##D                 diffusion.random = 0, 
##D                 drift.param = matrix(c(0.5,1.8,0.25,0.25,1,2,0.25,0.25),nrow=2,byrow=FALSE), 
##D                 diffusion.param = 0.1, nb.mixt = 2, mixt.prop = c(0.5,0.5))
##D 
##D # -- Estimation without validation
##D res <- msde.fit(times = sim$times, X = sim$X, model = 'OU', drift.random = c(1,2),
##D                 nb.mixt=2, Niter = 10)
##D 
##D summary(res)
##D plot(res)
##D 
##D # -- Estimation with prediction
##D res.valid <- msde.fit(times = sim$times, X = sim$X, model = 'OU', drift.random = c(1,2),
##D                       nb.mixt=2, Niter = 10, valid = 1)
##D 
##D summary(res.valid)
##D plot(res.valid)
##D 
##D # Example 3 : CIR with one random effect in the drift and one random effect in the diffusion 
##D # coefficient
##D 
##D sim <- msde.sim(M = 100, T = 5, N = 5000, model = 'CIR', drift.random = 2,
##D                 diffusion.random = 1, drift.param = c(4,1,0.1), diffusion.param = c(8,0.5),
##D                 X0 = 1)
##D 
##D res <- msde.fit(times = sim$times, X = sim$X, model = 'CIR', drift.random = 2,
##D                 diffusion.random = 1)
##D 
##D summary(res)
##D 
##D # Further examples can be found in the section dedicated to neuronal.data.
##D   
## End(Not run)




