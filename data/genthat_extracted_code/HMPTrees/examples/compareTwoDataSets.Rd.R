library(HMPTrees)


### Name: compareTwoDataSets
### Title: Likelihood-Ratio-Test Statistics to Compare the Distribution of
###   2 Sets of RDP-Based Taxonomic Trees
### Aliases: compareTwoDataSets

### ** Examples

	data(saliva)
	data(stool)
	
	### We use 1 for the number of permutations for computation time
	### This value should be at least 1000 for an accurate result
	numPerms <- 1
	
	pval <- compareTwoDataSets(saliva, stool, numPerms)
	pval



