library(CustomerScoringMetrics)


### Name: expMisclassCost
### Title: Calculate expected misclassification cost
### Aliases: expMisclassCost

### ** Examples

## Load response modeling data set
data("response")
## Apply expMisclassCost function to obtain the misclassification cost for the
## predictions for test sample. Assume a cost ratio of 5.
emc<-expMisclassCost(response$test[,2],response$test[,1],costType="costRatio", costs=5)
print(emc$EMC)




