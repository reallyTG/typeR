library(esvis)


### Name: tpac
### Title: Transformed proportion above the cut
### Aliases: tpac

### ** Examples

# Compute transformed PAC differences for all pairwise comparisons 
# for each of three cuts
tpac(reading ~ condition, 
		star, 
		cut = c(450, 500, 550)) 

# Report raw transformed PAC, instead of differences in transformed PAC
tpac(reading ~ condition, 
		star, 
		cut = c(450, 500, 550), 
		diff = FALSE) 

# Report transformed differences with regular-sized classrooms as the
# reference group
tpac(reading ~ condition, 
		star, 
		cut = c(450, 500, 550), 
		ref_group = "reg") 

# Return a matrix instead of a data frame 
# (returns a vector if only one cut is provided)
tpac(reading ~ condition, 
		star, 
		cut = c(450, 500, 550), 
		ref_group = "reg",
		tidy = FALSE) 



