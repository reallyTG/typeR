library(rase)


### Name: data.for.3d
### Title: Transform Output for 3D Plotting
### Aliases: data.for.3d

### ** Examples

  # load the mcmc results from rase run, polygons and tree
  data(rase_data, package = 'rase')

  pnames <- c('dextralis', 'viridis', 'leucoptera', 'interjecta', 
  'obscura', 'crepitans', 'ochroptera', 'napensis')
  psophia_poly <- name.poly(psophia_poly, psophia_tree, poly.names = pnames)

  # transform the data for 3d plotting
  df3 <- data.for.3d(mcmc, psophia_tree, psophia_poly)

  ## Not run: 
##D     # plot the tree in 3D
##D     phylo.3d(df3, z.scale = 10, pts = TRUE)
##D 
##D     # add the polygons representing the tip distributions
##D     add.polygons(df3)
##D 
##D     # add the posterior density at each node of the 3d tree
##D     add.dens(df3, mcmc, z.scale = 10, col = c(2:8))
##D   
## End(Not run)



