library(AUC)


### Name: plot.AUC
### Title: Plot the sensitivity, specificity, accuracy and roc curves.
### Aliases: plot.AUC

### ** Examples

data(churn)

plot(sensitivity(churn$predictions,churn$labels))

plot(specificity(churn$predictions,churn$labels))

plot(accuracy(churn$predictions,churn$labels))

plot(roc(churn$predictions,churn$labels))



