library(rase)


### Name: rase
### Title: Bayesian Range Ancestral State Estimation of Polygons
### Aliases: rase

### ** Examples

  # Here the application in the paper of Quintero et al.,
  # on the Psophia trumpeters 
  # is shown using rase package.
  	
  #load data
  data(rase_data, package = 'rase')  
  	
  ## Not run: 
##D     # check the data we are going to use
##D     # the phylogenetic tree
##D     psophia_tree
##D     	
##D     # the GPC polygons of Psophia distribution.
##D     psophia_poly
##D 
##D     # Species names of polygons (in order)
##D     pnames <- c('dextralis', 'viridis', 'leucoptera', 'interjecta', 
##D       'obscura', 'crepitans', 'ochroptera', 'napensis')
##D 
##D     # name the polygons
##D     psophia_poly <- name.poly(psophia_poly, psophia_tree, 
##D       poly.names = pnames)
##D 
##D     # Run rase for 10 iterations
##D     rase_results <- rase(psophia_tree, psophia_poly, niter = 100)
##D     # Run with higher number of iterations
##D     # rase_results <- rase(psophia_tree, polygons)
##D 
##D     # Use the amazing 'coda' package to explore the MCMC
##D     require(coda)
##D 
##D     # post-MCMC handling
##D     rasemcmc <- coda::mcmc(rase_results)
##D     	
##D     #plot the traces for all the parameters 
##D     plot(rasemcmc)
##D   
## End(Not run)




