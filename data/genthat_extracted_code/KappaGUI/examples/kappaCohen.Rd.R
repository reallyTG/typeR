library(KappaGUI)


### Name: kappaCohen
### Title: Calculates Cohen's kappa for all pairs of columns in a given
###   dataframe
### Aliases: kappaCohen
### Keywords: Kappa Cohen

### ** Examples

# Here we create and display an artifical dataset,
# describing two traits coded by two raters:
scores <- data.frame(
	Trait1_A = c(1,0,2,1,1,1,0,2,1,1),
	Trait1_B = c(1,2,0,1,2,1,0,1,2,1),
	Trait2_A = c(1,4,5,2,3,5,1,2,3,4),
	Trait2_B = c(2,5,2,2,4,5,1,3,1,4)
	)
scores

# Retrieve Cohen's kappa for Trait1 and Trait2,
# to evaluate inter-rater agreement between raters A and B:
kappaCohen(scores, weight="unweighted")
kappaCohen(scores, weight="squared")



