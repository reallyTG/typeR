library(AUC)


### Name: AUC-package
### Title: Threshold independent performance measures for probabilistic
###   classifiers.
### Aliases: AUC-package AUC

### ** Examples

data(churn)

auc(sensitivity(churn$predictions,churn$labels))
auc(specificity(churn$predictions,churn$labels))
auc(accuracy(churn$predictions,churn$labels))
auc(roc(churn$predictions,churn$labels))

plot(sensitivity(churn$predictions,churn$labels))
plot(specificity(churn$predictions,churn$labels))
plot(accuracy(churn$predictions,churn$labels))
plot(roc(churn$predictions,churn$labels))




