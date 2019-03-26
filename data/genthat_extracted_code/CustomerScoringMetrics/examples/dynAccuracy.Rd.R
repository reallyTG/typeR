library(CustomerScoringMetrics)


### Name: dynAccuracy
### Title: Calculate accuracy
### Aliases: dynAccuracy

### ** Examples

## Load response modeling data set
data("response")
## Apply dynAccuracy function to obtain the accuracy that is achieved on the test sample.
## Use validation sample predictions to dynamically determine a cutoff value.
acc<-dynAccuracy(response$test[,2],response$test[,1],dyn.cutoff=TRUE,predVal=
response$val[,2],depVal=response$val[,1])
print(acc)




