library(EasyMx)


### Name: emxThresholds
### Title: Create a set of thresholds for ordinal data
### Aliases: emxThresholds

### ** Examples

   
# Example
require(EasyMx)
data(jointdata)
jointdata[, c(2, 4, 5)] <- mxFactor(jointdata[,c(2, 4, 5)],
	levels=sapply(jointdata[,c(2, 4, 5)], function(x){sort(unique(x))}))
emxThresholds(jointdata, c(FALSE, TRUE, FALSE, TRUE, TRUE))




