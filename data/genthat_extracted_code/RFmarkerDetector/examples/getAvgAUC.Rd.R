library(RFmarkerDetector)


### Name: getAvgAUC
### Title: Computing the average AUC
### Aliases: getAvgAUC

### ** Examples

## load a simple dataset with the vectors of the predictions and the labels resulting from a CV 
data(simpleData)
avg_auc <- getAvgAUC(simpleData$predictions, simpleData$labels)



