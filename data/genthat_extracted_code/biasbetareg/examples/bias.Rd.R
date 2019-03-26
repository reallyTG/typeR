library(biasbetareg)


### Name: bias
### Title: Bias correction of the parameter estimates of the beta
###   regression model
### Aliases: bias

### ** Examples

require(betareg)
## Section 4 from Ferrari and Cribari-Neto (2004)
	data("GasolineYield", package = "betareg")
	bbt <- betareg(yield ~ batch + temp, data = GasolineYield)
	bias(bbt)

	## Section 3 from online supplements to Simas et al. (2010)
	## mean model as in gy above
	## precision model with regressor temp
	bbt2 <- betareg(yield ~ batch + temp | temp, data = GasolineYield)
	bias(bbt2)



