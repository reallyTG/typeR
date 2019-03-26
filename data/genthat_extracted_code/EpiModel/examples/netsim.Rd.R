library(EpiModel)


### Name: netsim
### Title: Stochastic Network Models
### Aliases: netsim
### Keywords: model

### ** Examples

## Not run: 
##D ## Example 1: Independent SI Model
##D # Network model estimation
##D nw <- network.initialize(n = 100, bipartite = 50, directed = FALSE)
##D formation <- ~edges
##D target.stats <- 50
##D coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 20)
##D est1 <- netest(nw, formation, target.stats, coef.diss, verbose = FALSE)
##D 
##D # Epidemic model
##D param <- param.net(inf.prob = 0.3, inf.prob.m2 = 0.15)
##D init <- init.net(i.num = 10, i.num.m2 = 10)
##D control <- control.net(type = "SI", nsteps = 100, nsims = 5, verbose.int = 0)
##D mod1 <- netsim(est1, param, init, control)
##D 
##D # Print, plot, and summarize the results
##D mod1
##D plot(mod1)
##D summary(mod1, at = 50)
##D 
##D ## Example 2: Dependent SIR Model
##D # Recalculate dissolution coefficient with departure rate
##D coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 20,
##D                                d.rate = 0.0021)
##D 
##D # Reestimate the model with new coefficient
##D est2 <- netest(nw, formation, target.stats, coef.diss, verbose = FALSE)
##D 
##D # Reset parameters to include demographic rates
##D param <- param.net(inf.prob = 0.3, inf.prob.m2 = 0.15,
##D                    rec.rate = 0.02, rec.rate.m2 = 0.02,
##D                    a.rate = 0.002, a.rate.m2 = NA,
##D                    ds.rate = 0.001, ds.rate.m2 = 0.001,
##D                    di.rate = 0.001, di.rate.m2 = 0.001,
##D                    dr.rate = 0.001, dr.rate.m2 = 0.001)
##D init <- init.net(i.num = 10, i.num.m2 = 10,
##D                  r.num = 0, r.num.m2 = 0)
##D control <- control.net(type = "SIR", nsteps = 100, nsims = 5)
##D 
##D # Simulate the model with new network fit
##D mod2 <- netsim(est2, param, init, control)
##D 
##D # Print, plot, and summarize the results
##D mod2
##D plot(mod2)
##D summary(mod2, at = 100)
## End(Not run)




