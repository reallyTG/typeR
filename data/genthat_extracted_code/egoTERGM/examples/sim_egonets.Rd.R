library(egoTERGM)


### Name: sim_egonets
### Title: Simulation of longitudinal ego-networks according to a mixture
###   of data generating processes and fitting of ego-TERGM to that
###   network.
### Aliases: sim_egonets
### Keywords: networks simulation

### ** Examples

## No test: 
net <- sim_egonets(form = c("edges", "gwesp(0.8,fixed=TRUE)", "gwdegree(decay=0.8,fixed=TRUE)"),
                  params = rbind(c(-3,1,0), c(-1,-2,-1), c(-2,0,2)),
                  roles = 3,
                  N_per_role = 10,
                  t_steps = 3,
                  egonet_size = 20,
                  seed = 12345,
                  R = 30,
                  forking = FALSE,
                  ncpus = 1,
                  steps = 50,
                  tol = 1e-6)
## End(No test)



