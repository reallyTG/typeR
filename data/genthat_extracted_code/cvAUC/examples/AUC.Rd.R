library(cvAUC)


### Name: AUC
### Title: Area Under the ROC Curve
### Aliases: AUC

### ** Examples

library(cvAUC)

data(ROCR.simple)
auc <- AUC(ROCR.simple$predictions, ROCR.simple$labels)
# [1] 0.8341875




