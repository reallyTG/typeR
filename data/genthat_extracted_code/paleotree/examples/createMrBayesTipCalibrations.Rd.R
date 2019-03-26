library(paleotree)


### Name: createMrBayesTipCalibrations
### Title: Construct A Block of Tip Age Calibrations for Use with
###   Tip-Dating Analyses in MrBayes
### Aliases: createMrBayesTipCalibrations

### ** Examples


# load retiolitid dataset
data(retiolitinae)

# uniform prior, with a 10 million year offset for
	# the expected tree age from the earliest first appearance

createMrBayesTipCalibrations(tipTimes = retioRanges, whichAppearance = "first",
	ageCalibrationType = "uniformRange", treeAgeOffset = 10)

# fixed prior, at the earliest bound for the first appearance

createMrBayesTipCalibrations(tipTimes = retioRanges, whichAppearance = "first",
	ageCalibrationType = "fixedDateEarlier", treeAgeOffset = 10)

# fixed prior, sampled from between the bounds on the last appearance
	# you should probably never do this, fyi

createMrBayesTipCalibrations(tipTimes = retioRanges, whichAppearance = "first",
	ageCalibrationType = "fixedDateRandom", treeAgeOffset = 10)


## Not run: 
##D 
##D createMrBayesTipCalibrations(tipTimes = retioRanges, whichAppearance = "first",
##D 	ageCalibrationType = "uniformRange", treeAgeOffset = 10, file = "tipCalibrations.txt")
##D 
## End(Not run)




