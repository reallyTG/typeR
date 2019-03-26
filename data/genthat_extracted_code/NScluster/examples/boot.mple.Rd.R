library(NScluster)


### Name: boot.mple
### Title: Bootstrap resampling for MPLE
### Aliases: boot.mple summary.boot.mple
### Keywords: spatial

### ** Examples

### Thomas Model
# simulation
pars <- c(mu = 50.0, nu = 30.0, sigma = 0.03)
t.sim <- sim.cppm("Thomas", pars, seed = 117)

## Not run: 
##D  # estimation (need long CPU time)
##D init.pars <- c(mu = 40.0, nu = 40.0, sigma = 0.05)
##D t.mple <- mple.cppm("Thomas", t.sim$offspring$xy, init.pars)
##D t.boot <- boot.mple(t.mple)
##D summary(t.boot)
## End(Not run)



