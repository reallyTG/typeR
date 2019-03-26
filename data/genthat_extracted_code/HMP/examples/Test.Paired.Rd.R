library(HMP)


### Name: Test.Paired
### Title: Test Paired Data Sets
### Aliases: Test.Paired

### ** Examples

	data(saliva)
	data(throat)
	
	
	### Since saliva and throat come from same subjects, the data is paired 
	saliva1 <- saliva[-24,] # Make saliva 23 subjects to match throat
	group.data <- list(throat, saliva1)
	
	### We use 1 for speed, should be at least 1,000
	numPerms <- 1
	
	pval <- Test.Paired(group.data, numPerms)
	pval



