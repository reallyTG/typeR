library(HMPTrees)


### Name: getMLEandLoglike
### Title: Get MLE and Log Likelihood of a Data Set
### Aliases: getMLEandLoglike

### ** Examples

	data(saliva)
	
	### We use 1 for the maximum number of steps for computation time
	### This value should be much higher to ensure an accurate result
	numSteps <- 1
	
	mle <- getMLEandLoglike(saliva, numSteps)$mleTree



