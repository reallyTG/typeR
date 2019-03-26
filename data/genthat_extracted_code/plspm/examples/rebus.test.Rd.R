library(plspm)


### Name: rebus.test
### Title: Permutation Test for REBUS Multi-Group Comparison
### Aliases: rebus.test

### ** Examples

## Not run: 
##D  ## typical example of PLS-PM in customer satisfaction analysis
##D  ## model with six LVs and reflective indicators
##D  ## example of rebus analysis with simulated data
##D 
##D  # load data
##D  data(simdata)
##D 
##D  # Calculate plspm
##D  sim_path = matrix(c(0,0,0,0,0,0,1,1,0), 3, 3, byrow=TRUE)
##D  dimnames(sim_path) = list(c("Price", "Quality", "Satisfaction"),
##D                             c("Price", "Quality", "Satisfaction"))
##D  sim_blocks = list(c(1,2,3,4,5), c(6,7,8,9,10), c(11,12,13))
##D  sim_mod = c("A", "A", "A")  # reflective indicators
##D  sim_global = plspm(simdata, sim_path,
##D                     sim_blocks, modes=sim_mod)
##D  sim_global
##D 
##D  # Cluster analysis on residuals of global model
##D  sim_clus = res.clus(sim_global)
##D 
##D  # Iterative steps of REBUS algorithm on 2 classes
##D  rebus_sim = it.reb(sim_global, sim_clus, nk=2,
##D                     stop.crit=0.005, iter.max=100)
##D 
##D  # apply rebus.test
##D  sim_permu = rebus.test(sim_global, rebus_sim)
##D 
##D  # inspect sim.rebus
##D  sim_permu
##D  sim_permu$test_1_2
##D 
##D  # or equivalently
##D  sim_permu[[1]]
##D  
## End(Not run)



