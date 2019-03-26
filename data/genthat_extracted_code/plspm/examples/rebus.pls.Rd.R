library(plspm)


### Name: rebus.pls
### Title: Response Based Unit Segmentation (REBUS)
### Aliases: rebus.pls

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
##D  sim_inner = matrix(c(0,0,0,0,0,0,1,1,0), 3, 3, byrow=TRUE)
##D  dimnames(sim_inner) = list(c("Price", "Quality", "Satisfaction"),
##D                             c("Price", "Quality", "Satisfaction"))
##D  sim_outer = list(c(1,2,3,4,5), c(6,7,8,9,10), c(11,12,13))
##D  sim_mod = c("A", "A", "A")  # reflective indicators
##D  sim_global = plspm(simdata, sim_inner,
##D                     sim_outer, modes=sim_mod)
##D  sim_global
##D 
##D  # run rebus.pls and choose the number of classes
##D  # to be taken into account according to the displayed dendrogram.
##D  rebus_sim = rebus.pls(sim_global, stop.crit = 0.005, iter.max = 100)
##D 
##D  # You can also compute complete outputs for local models by running:
##D  local_rebus = local.models(sim_global, rebus_sim)
##D  
## End(Not run)



