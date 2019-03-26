library(HMP)


### Name: Xsc.onesample
### Title: Generalized Wald-Type Statistics: One Sample RAD
###   Probability-Mean Test Comparison
### Aliases: Xsc.onesample

### ** Examples

	data(saliva)
	data(throat)
	
	### Get pi from the dirichlet-multinomial parameters
	pi0 <- dirmult(saliva)$pi
	
	xsc <- Xsc.onesample(throat, pi0)
	xsc



