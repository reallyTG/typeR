library(rase)


### Name: bm_ase
### Title: Bayesian Ancestral State Estimation with Points
### Aliases: bm_ase

### ** Examples

  ### Create some data to be analyzed
  # Number of taxa
  ntaxa <- 10

  # Known parameters
  mean_x <- 0
  mean_y <- 0
  sigma_x <- 1 
  sigma_y <- 1

  # Create a random tree
  tree <- ape::rtree(n = ntaxa)

  # Create random data according to tree structure
  x_locs <- as.numeric(mvtnorm::rmvnorm(1, rep(mean_x,ntaxa), sigma=sigma_x*vcv(tree)))
  y_locs <- as.numeric(mvtnorm::rmvnorm(1, rep(mean_y,ntaxa), sigma=sigma_y*vcv(tree)))
  values = list(x = x_locs, y = y_locs)
  ## Not run: 
##D     # run bm_ase for 10 iterations
##D     bm_results = bm_ase(tree, values, niter = 10)
##D   
## End(Not run)



