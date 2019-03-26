library(designmatch)


### Name: loveplot
### Title: Love plot for assessing covariate balance
### Aliases: loveplot

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
	X_mat = cbind(log2pop, popgrowth1939, popgrowth3339, emprate, indrate, 
	rubble, rubblemiss, flats, flatsmiss, refugees)

	# Indices of the matched controls (obtained using bmatch in designmatch)
	c_id = c(67, 75, 39, 104, 38, 93, 79, 59, 64, 55, 106, 99, 97, 61, 82, 57, 76, 47, 46, 49)
 
	# Vertical line for satisfactory balance
	vline = 0.15
	
 	# loveplot
	loveplot(X_mat, t_id, c_id, vline) 



