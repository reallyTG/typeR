library(rase)


### Name: ranges.like.bm
### Title: n-dimensional Maximumn Likelihood of Range Brownian Motion
### Aliases: ranges.like.bm

### ** Examples

	# Number of taxa to simulate tree
	ntaxa <- 10

	# Known parameters 
	# for three dimension
	mean_x <- 0
	mean_y <- 0
	mean_z <- 0

	sigma2x <- 1 
	sigma2y <- 2
	sigma2z <- 3

	# Create a random tree
	tree <- ape::rtree(n = ntaxa)

	# Create random data according to tree structure
	x_locs <- as.numeric(mvtnorm::rmvnorm(1, rep(mean_x,ntaxa), sigma=sigma2x*vcv(tree)))
	y_locs <- as.numeric(mvtnorm::rmvnorm(1, rep(mean_y,ntaxa), sigma=sigma2y*vcv(tree)))
	z_locs <- as.numeric(mvtnorm::rmvnorm(1, rep(mean_z,ntaxa), sigma=sigma2z*vcv(tree)))

	# random shifts to the mean to create ranges
	xshift <- rexp(ntaxa)
	yshift <- rexp(ntaxa)
	zshift <- rexp(ntaxa)
	x_lower <- x_locs - xshift
	x_upper <- x_locs + xshift
	y_lower <- y_locs - yshift
	y_upper <- y_locs + yshift
	z_lower <- z_locs - zshift
	z_upper <- z_locs + zshift

	# store rectangles: this is the trait data:
	lower_bounds <- list(xl=x_lower, yl=y_lower, zl=z_lower ) 
	upper_bounds <- list(xu=x_upper, yu=y_upper, zu=z_upper) 

	## Not run: 
##D 	#run range.like.bm
##D 		range_results <- ranges.like.bm(tree, lower_bounds, upper_bounds)
##D 	
## End(Not run)



