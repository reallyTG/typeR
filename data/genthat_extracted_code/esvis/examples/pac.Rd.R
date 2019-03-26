library(esvis)


### Name: pac
### Title: Compute the proportion above a specific cut location
### Aliases: pac

### ** Examples

# Compute differences for all pairwise comparisons for each of three cuts
pac(reading ~ condition, 
		star, 
		cut = c(450, 500, 550)) 

# Report raw PAC, instead of differences in PAC
pac(reading ~ condition, 
		star, 
		cut = c(450, 500, 550), 
		diff = FALSE) 

# Report differences with regular-sized classrooms as the reference group
pac(reading ~ condition, 
		star, 
		cut = c(450, 500, 550), 
		ref_group = "reg") 

# Return a matrix instead of a data frame 
# (returns a vector if only one cut is provided)
pac(reading ~ condition, 
		star, 
		cut = c(450, 500, 550), 
		ref_group = "reg",
		tidy = FALSE) 



