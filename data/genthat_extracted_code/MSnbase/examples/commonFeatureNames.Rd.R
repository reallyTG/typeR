library(MSnbase)


### Name: commonFeatureNames
### Title: Keep only common feature names
### Aliases: commonFeatureNames

### ** Examples

library("pRolocdata")
data(tan2009r1)
data(tan2009r2)
cmn <- commonFeatureNames(tan2009r1, tan2009r2)
names(cmn)
## as a named list
names(commonFeatureNames(list(a = tan2009r1, b = tan2009r2)))
## without message
suppressMessages(cmn <- commonFeatureNames(tan2009r1, tan2009r2))
## more than 2 instance
data(tan2009r3)
cmn <- commonFeatureNames(list(tan2009r1, tan2009r2, tan2009r3))
length(cmn)



