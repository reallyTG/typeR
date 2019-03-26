library(KappaGUI)


### Name: kappaFleiss
### Title: Calculates Fleiss' kappa between k raters for all k-uplets of
###   columns in a given dataframe
### Aliases: kappaFleiss
### Keywords: Kappa Fleiss

### ** Examples

# Here we create and display an artifical dataset,
# describing two traits coded by three raters:
scores <- data.frame(
	Trait1_A = c(1,0,2,1,1,1,0,2,1,1),
	Trait1_B = c(1,2,0,1,2,1,0,1,2,1),
	Trait1_C = c(2,2,2,1,1,1,0,1,2,1),
	Trait2_A = c(1,4,5,2,3,5,1,2,3,4),
	Trait2_B = c(2,5,2,2,4,5,1,3,1,4),
	Trait2_C = c(2,4,3,2,4,5,2,2,3,4)
	)
scores

# Retrieve Fleiss' kappa for Trait1 and Trait2,
# to evaluate inter-rater agreement between raters A, B and C:
kappaFleiss(scores, nb_raters=3)



