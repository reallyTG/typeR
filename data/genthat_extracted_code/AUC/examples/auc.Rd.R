library(AUC)


### Name: auc
### Title: Compute the area under the curve of a given performance measure.
### Aliases: auc

### ** Examples

data(churn)

auc(sensitivity(churn$predictions,churn$labels))

auc(specificity(churn$predictions,churn$labels))

auc(accuracy(churn$predictions,churn$labels))

auc(roc(churn$predictions,churn$labels))



