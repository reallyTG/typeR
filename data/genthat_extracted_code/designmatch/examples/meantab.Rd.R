library(designmatch)


### Name: meantab
### Title: Tabulate means of covariates after matching
### Aliases: meantab

### ** Examples

	# Load data
	data(germancities)

	# Sort and attach data
	germancities = germancities[order(germancities$treat, decreasing = TRUE), ]
	attach(germancities)

	# Treatment indicator
	t_ind = treat
	
	# Indexes of the treated units
	t_id = which(t_ind == 1)

	# Matrix of covariates
	X_mat = cbind(log2pop, popgrowth1939, popgrowth3339, emprate, indrate, rubble, 
	rubblemiss, flats, flatsmiss, refugees)

	# Indices of the matched controls (obtained using bmatch in designmatch)
	c_id = c(67, 75, 39, 104, 38, 93, 79, 59, 64, 55, 106, 99, 97, 61, 82, 57, 
	76, 47, 46, 49)
 
 	# meantab
	meantab(X_mat, t_ind, t_id, c_id)
	
	# meantab
	meantab(X_mat, t_ind, t_id, c_id, exact = c(rep("w", 6), "f", "w", "f", "w"), digits = 3)



