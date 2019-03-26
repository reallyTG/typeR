library(HMP)


### Name: Xdc.sevsample
### Title: Likelihood-Ratio-Test Statistics: Several Sample
###   Dirichlet-Multinomial Test Comparison
### Aliases: Xdc.sevsample

### ** Examples

	data(saliva) 
	data(throat)
	
	### Combine the data sets into a single list
	group.data <- list(saliva, throat)
	
	xdc <- Xdc.sevsample(group.data)
	xdc



