library(waterData)


### Name: cleanUp
### Title: Cleans up hydrologic time series data
### Aliases: cleanUp
### Keywords: NA manip ts utilities

### ** Examples

data(exampleWaterData)
head(badDataSet)
cleanUp(badDataSet, task="view")
q05054000Fix <- cleanUp(badDataSet, task="fix")
# replace 0s with NA, then one could use the fillMiss function
# to estimate values
q05054000Fix2 <- cleanUp(badDataSet, task="fix", replace=NA)
summary(badDataSet)
summary(q05054000Fix)
summary(q05054000Fix2)



