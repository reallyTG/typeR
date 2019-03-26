library(designmatch)


### Name: finetab
### Title: Tabulate the marginal distribution of a nominal covariate after
###   matching
### Aliases: finetab

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

	# Indixes of the matched controls (obtained using bmatch in designmatch)
	c_id = c(80, 82, 35, 59, 69, 68, 34, 62, 104, 61, 106, 120, 56, 119, 28, 
	113, 76, 118, 75, 71)
 
 	# finetab
	finetab(publicat, t_id, c_id)
	finetab(busiservcat, t_id, c_id)



