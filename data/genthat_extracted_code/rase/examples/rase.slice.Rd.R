library(rase)


### Name: rase.slice
### Title: Ancestral State Estimation At Any Given Time Slice
### Aliases: rase.slice

### ** Examples

  #load data
  data(rase_data, package = 'rase')	
  	
  ## Not run: 
##D     # check the data we are going to use
##D     	
##D     # examine the mcmc result from rase 
##D     # after it has been applied a burnin 
##D     # phase and a thinning
##D     str(mcmc)
##D     	
##D     # the phylogenetic tree used in the rase run
##D     psophia_tree
##D 
##D     # the polygons used in the rase run
##D     str(psophia_poly)
##D     		
##D     # define the slice of time;
##D     # for now, let's say 1 Million
##D     # years ago (Ma)
##D     slice <- 1
##D 
##D     # Species names of polygons (in order)
##D     pnames <- c('dextralis', 'viridis', 'leucoptera', 'interjecta', 
##D       'obscura', 'crepitans', 'ochroptera', 'napensis')
##D 
##D     # name the polygons
##D     psophia_poly <- name.poly(psophia_poly, psophia_tree, poly.names = pnames)
##D     	
##D     # run rase slice for 100 iterations
##D     slice_results <- rase.slice(psophia_tree, slice = slice, res = mcmc, 
##D           psophia_poly, niter = 100)
##D     	
##D     #check results
##D     str(slice_results)
##D   
## End(Not run)



