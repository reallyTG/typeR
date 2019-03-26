library(plspm)


### Name: res.clus
### Title: Clustering on communality and structural residuals
### Aliases: res.clus

### ** Examples

## Not run: 
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
##D  sim_modes = c("A", "A", "A")
##D  sim_global = plspm(simdata, sim_path,
##D                     sim_blocks, modes=sim_modes)
##D  sim_global
##D 
##D  # Then compute cluster analysis on the residuals of global model
##D  sim_clus = res.clus(sim_global)
##D  
## End(Not run)



