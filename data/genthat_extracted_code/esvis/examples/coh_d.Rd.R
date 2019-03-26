library(esvis)


### Name: coh_d
### Title: Compute Cohen's _d_
### Aliases: coh_d

### ** Examples


# Calculate Cohen's d for all pairwise comparisons
coh_d(reading ~ condition, star) 

# Report only relative to regular-sized classrooms
coh_d(reading ~ condition, 
		star, 
		ref_group = "reg")

# Return a vector instead of a data frame
coh_d(reading ~ condition, 
		star, 
		ref_group = "reg", 
		tidy = FALSE)



