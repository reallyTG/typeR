library(CustomerScoringMetrics)


### Name: misclassCost
### Title: Calculate misclassification cost
### Aliases: misclassCost

### ** Examples

## Load response modeling data set
data("response")
## Generate cost vector
costs <- runif(nrow(response$test), 1, 100)
## Apply misclassCost function to obtain the misclassification cost for the
## predictions for test sample. Assume a cost ratio of 5.
emc<-misclassCost(response$test[,2],response$test[,1],costType="costVector", costs=costs)
print(emc$EMC)




