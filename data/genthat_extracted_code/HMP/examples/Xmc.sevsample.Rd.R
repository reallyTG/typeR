library(HMP)


### Name: Xmc.sevsample
### Title: Generalized Wald-type Statistics: Several Sample RAD
###   Probability-Mean Test Comparison with a Known Common Vector
### Aliases: Xmc.sevsample

### ** Examples

	data(saliva) 
	data(throat)
	data(tonsils)
	
	### Get pi from the dirichlet-multinomial parameters
	pi0 <- dirmult(saliva)$pi
	
	### Combine the data sets into a single list
	group.data <- list(throat, tonsils)
	
	xmc <- Xmc.sevsample(group.data, pi0)
	xmc



