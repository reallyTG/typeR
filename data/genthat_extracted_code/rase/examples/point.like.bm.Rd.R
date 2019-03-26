library(rase)


### Name: point.like.bm
### Title: n-dimensional Maximum Likelihood of Point Brownian Motion
### Aliases: point.like.bm

### ** Examples

	# Number of taxa to simulate tree
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
	values <- list(x_locs,y_locs)

	## Not run: 
##D 		# run point.like.bm
##D 		bm_results = point.like.bm(tree, values)
##D 	
## End(Not run)



