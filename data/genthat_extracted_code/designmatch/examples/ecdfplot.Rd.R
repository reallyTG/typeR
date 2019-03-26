library(designmatch)


### Name: ecdfplot
### Title: Empirical cumulative distribution function plot for assessing
###   covariate balance
### Aliases: ecdfplot

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
		
	# Indexes of the controls before matching
	c_id_before = which(t_ind == 0)
	
	# Indixes of the matched controls (obtained using bmatch in designmatch)
	c_id_after = c(80, 82, 35, 59, 69, 68, 34, 62, 104, 61, 106, 120, 56, 119, 28, 
	113, 76, 118, 75, 71)
	
	# ecdfplot
	par(mfrow = c(2, 1))
	ecdfplot(rubble, t_id, c_id_before, "Before matching")
	ecdfplot(rubble, t_id, c_id_after, "After matching")



