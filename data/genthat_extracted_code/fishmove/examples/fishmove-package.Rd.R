library(fishmove)


### Name: fishmove-package
### Title: Prediction of Fish Movement Parameters based on Multiple
###   Regression
### Aliases: fishmove-package
### Keywords: package

### ** Examples

	# Prediction for a selected fish species with time=365 days
	trout <- fishmove(species="Salmo trutta fario",T=365)

	# Plot of a leptokurtic dispersal kernel 
	# (density plot for fitted mean, lower and upper limit)
	pdk(trout)



