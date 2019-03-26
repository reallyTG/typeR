library(EpiModel)


### Name: summary.netsim
### Title: Summary Model Statistics
### Aliases: summary.netsim
### Keywords: extract

### ** Examples

## Not run: 
##D ## Independent SI Model
##D # Initialize network and set network model parameters
##D nw <- network.initialize(n = 100, bipartite = 50, directed = FALSE)
##D formation <- ~edges
##D target.stats <- 50
##D coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 20)
##D 
##D # Estimate the ERGM models (see help for netest)
##D est1 <- netest(nw, formation, target.stats, coef.diss, verbose = FALSE)
##D 
##D # Parameters, initial conditions, and controls for model
##D param <- param.net(inf.prob = 0.3, inf.prob.m2 = 0.15)
##D init <- init.net(i.num = 10, i.num.m2 = 10)
##D control <- control.net(type = "SI", nsteps = 100, nsims = 5, verbose.int = 0)
##D 
##D # Run the model simulation
##D mod <- netsim(est1, param, init, control)
##D 
##D summary(mod, at = 1)
##D summary(mod, at = 50)
##D summary(mod, at = 100)
## End(Not run)




