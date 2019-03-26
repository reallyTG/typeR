library(esvis)


### Name: hedg_g
### Title: Compute Hedges' _g_ This function calculates effect sizes in
###   terms of Hedges' _g_, also called the corrected (for sample size)
###   effect size. See 'coh_d' for the uncorrected version. Also see Lakens
###   (2013) for a discussion on different types of effect sizes and their
###   interpretation. Note that missing data are removed from the
###   calculations of the means and standard deviations.
### Aliases: hedg_g

### ** Examples


# Calculate Hedges' g for all pairwise comparisons
hedg_g(reading ~ condition, star) 

# Report only relative to regular-sized classrooms
hedg_g(reading ~ condition, 
		star, 
		ref_group = "reg")

# Return a vector instead of a data frame
hedg_g(reading ~ condition, 
		star, 
		ref_group = "reg", 
		tidy = FALSE)



