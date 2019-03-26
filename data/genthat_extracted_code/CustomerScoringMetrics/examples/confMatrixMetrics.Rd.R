library(CustomerScoringMetrics)


### Name: confMatrixMetrics
### Title: Obtain several metrics based on the confusion matrix
### Aliases: confMatrixMetrics

### ** Examples

## Load response modeling data set
data("response")
## Apply confMatrixMetrics function to obtain confusion matrix-based performance metrics
## achieved on the test sample. Use validation sample predictions to dynamically
## determine a cutoff value.
cmm<-confMatrixMetrics(response$test[,2],response$test[,1],dyn.cutoff=TRUE,
predVal=response$val[,2],depVal=response$val[,1])
## Retrieve F1-score
print(cmm$F1Score)




