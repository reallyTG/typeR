library(designmatch)


### Name: distmat
### Title: Build a rank-based Mahalanobis distance matrix
### Aliases: distmat

### ** Examples

	# Load data
	data(germancities)
	attach(germancities)

	# Treatment indicator
	t_ind = treat

	# Matrix of covariates
	X_mat = cbind(log2pop, popgrowth1939, popgrowth3339, emprate, indrate, rubble, 
	rubblemiss, flats, flatsmiss, refugees)

	# Distance matrix
	dist_mat = distmat(t_ind, X_mat)



