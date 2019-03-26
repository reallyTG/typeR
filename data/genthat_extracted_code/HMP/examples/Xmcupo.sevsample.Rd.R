library(HMP)


### Name: Xmcupo.sevsample
### Title: Generalized Wald-type Statistics: Several Sample RAD
###   Probability-Mean Test Comparison with an Unknown Common Vector
### Aliases: Xmcupo.sevsample

### ** Examples

	data(saliva) 
	data(tonsils)
	data(throat)
	
	### Combine the data sets into a single list
	group.data <- list(saliva, throat, tonsils)
	
	xmcupo <- Xmcupo.sevsample(group.data)
	xmcupo



