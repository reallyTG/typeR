library(CustomerScoringMetrics)


### Name: dynConfMatrix
### Title: Calculate a confusion matrix
### Aliases: dynConfMatrix

### ** Examples

## Load response modeling data set
data("response")
## Apply dynConfMatrix function to obtain a confusion matrix. Use validation sample
## predictions to dynamically determine an incidence-based cutoff value.
cm<-dynConfMatrix(response$test[,2],response$test[,1],dyn.cutoff=TRUE,
predVal=response$val[,2],depVal=response$val[,1])
print(cm)




