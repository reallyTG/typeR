library(HMPTrees)


### Name: generateTree
### Title: Generate Test Trees
### Aliases: generateTree

### ** Examples

	data(saliva)
	
	### Generate a the number of reads per sample
	### The first number is the number of reads and the second is the number of subjects
	nrs <- rep(10000, 2)
	
	gendata <- generateTree(saliva, nrs)



