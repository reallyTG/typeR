library(designmatch)


### Name: pairsplot
### Title: Pairs plot for visualizing matched pairs
### Aliases: pairsplot

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
	
	# Indices of the matched controls (obtained using bmatch in designmatch)
	c_id = c(67, 75, 39, 104, 38, 93, 79, 59, 64, 55, 106, 99, 97, 61, 82, 
	57, 76, 47, 46, 49)
 
	# pairsplot	
	pairsplot(rubble, flats, t_id, c_id, "Rubble", "Flats", "")



