library(plspm)


### Name: local.models
### Title: PLS-PM for global and local models
### Aliases: local.models

### ** Examples

## Not run: 
##D ## Example of REBUS PLS with simulated data
##D 
##D # load simdata
##D data("simdata", package='plspm')
##D 
##D # Calculate global plspm
##D sim_inner = matrix(c(0,0,0,0,0,0,1,1,0), 3, 3, byrow=TRUE)
##D dimnames(sim_inner) = list(c("Price", "Quality", "Satisfaction"),
##D                            c("Price", "Quality", "Satisfaction"))
##D sim_outer = list(c(1,2,3,4,5), c(6,7,8,9,10), c(11,12,13))
##D sim_mod = c("A", "A", "A")  # reflective indicators
##D sim_global = plspm(simdata, sim_inner,
##D                    sim_outer, modes=sim_mod)
##D sim_global
##D 
##D ## Then compute cluster analysis on residuals of global model
##D sim_clus = res.clus(sim_global)
##D 
##D ## To complete REBUS, run iterative algorithm
##D rebus_sim = it.reb(sim_global, sim_clus, nk=2,
##D                    stop.crit=0.005, iter.max=100)
##D 
##D ## You can also compute complete outputs
##D ## for local models by running:
##D local_rebus = local.models(sim_global, rebus_sim)
##D 
##D # Display plspm summary for first local model
##D summary(local_rebus$loc.model.1)
## End(Not run)



